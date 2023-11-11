from datetime import datetime
from django.db.models import Q
from django.http import HttpResponse,JsonResponse
from django.shortcuts import render,redirect,get_object_or_404
from django.contrib.auth.forms import UserCreationForm,AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth import login,logout,authenticate
from django.db import IntegrityError
from .forms import *
from .models import *
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
# the homepage 
def home(request):
    # return HttpResponse('<h1>Pagina de Inicio</h1>')
    #return JsonResponse({'pagina':"Principal","autor":"Daniel"})
    context = {'title':'Instituto Tecnologico Unemi'}
    return render(request, 'home.html',context)

# the users
def register(request):
    print(request.method,request.path,request.user)
    if request.method == 'GET':
        print(request.GET)
        context = {'title':'Registro de Usuario','form': UserCreationForm()}
        return render(request, 'register.html',context)
    else:
        print(request.POST,request.POST['username'],request.POST.get('password1'))
        if request.POST['password1'] == request.POST['password2']:
           try:
                user = User.objects.create_user(username=request.POST['username'],password=request.POST['password1'])
                user.save() 
                login(request,user) # crea una cooki del usuario registrado
                return redirect('home')
           except IntegrityError:
                context = {'title':'Registro de Usuario','form': UserCreationForm(request.POST),'error':'Usuario ya existe'}
                return render(request, 'register.html',context)
        context = {'title':'Registro de Usuario','form': UserCreationForm(request.POST),'error':'Password no coinciden'}
        return render(request, 'register.html',context)
    

def iniciarSesion(request):
    if request.method == 'GET':
        context = {'title':'Iniciar Sesion','form':AuthenticationForm}
        return render(request, 'login.html',context)
    else:
        print(request.POST)
        user = authenticate(request,username=request.POST['username'],password=request.POST['password'])
        if user is None:
            context = {'title':'Iniciar Sesion','form':AuthenticationForm,'error':'Usuario o password incorrecto'}
            return render(request, 'login.html',context) 
        else:
            login(request,user) # crea una cooki del usuario registrado - guardar session
            return redirect('home')

@login_required
def cerrarSesion(request):
    logout(request)
    return redirect('login')

# crud the students
@login_required
def student(request):
    context, students = None, None
    try:
        q = request.GET.get('q')  # ver
        if q:
            students = Student.objects.filter(
                Q(user=request.user) & (Q(lastname__icontains=q) | Q(firstname__icontains=q))
            )
        else:
            students = Student.objects.filter(user=request.user)

        paginator = Paginator(students, 2)
        pagina = request.GET.get('page', 1)
        students_paginados = paginator.get_page(pagina)

        context = {
            'students': students_paginados,
            'title': 'Consulta de Estudiantes',
            'paginator': paginator,
            'num_pages': paginator.num_pages,
        }

        return render(request, 'students.html', context)
    except:
        return render(request, 'students.html', {'title': 'Consulta de Estudiantes', 'error': 'Ha ocurrido un error en la consulta'})

@login_required
def create_student(request):
    form=None
    if request.method == "GET":
        context = {'title':'Registro de Estudiante','form':StudentForm,'error':''}
        return render(request, 'create_student.html',context)
    else:
        try:
            form = StudentForm(request.POST)
            print(form)
            print(request.POST)
            print(request.user)
            if form.is_valid():
                student = form.save(commit=False)# lo tiene en memoria
                student.user = request.user
                student.save() # lo guarda en la BD
                return redirect('students')
            else:
                return render(request, 'create_student.html', {"form": form, "error": "Error de datos invalidos."}) 
        except:
            return render(request, 'create_student.html', {"form": form, "error": f"Error al registrar estudiante"})

@login_required
def detail_student(request,id):
    student=None
    try:
        student = Student.objects.get(user=request.user,pk=id)
        # select * from stident where user="admin" and id=2
        student.graduate=True
        student.dategraduate=datetime.now()
        student.save()
        return redirect('students')
    except:
        context = {'title':'Datos del Estudiante','student':student,'error':f'Error al seleccionar estudiante'}
        return render(request, 'detail_student.html',context)  
    
@login_required
def update_student(request,id):
    student = Student.objects.filter(user=request.user,pk=id).first()
    form=None
    print(student)
    if request.method == "GET":
       form = StudentForm(instance=student)
       context = {'title':'Editar Estudiante','form':form,'error':''}
       return render(request, 'create_student.html',context)
    else:
        try:
            form = StudentForm(request.POST,instance=student)
            if form.is_valid():
                form.save()
                return redirect('students')
            else:
                return render(request, 'create_student.html', {"form": form, "error": "Error de datos invalidos."})  
        except:
            return render(request, 'create_student.html', {"form": form, "error": f"Error al actualizar estudiante"})

@login_required
def delete_student(request,id):
    student=None
    try:
        student = Student.objects.get(user=request.user,pk=id)
        if request.method == "GET":
            context = {'title':'Estudiante a Eliminar','student':student,'error':''}
            return render(request, 'delete_student.html',context)  
        else: 
            student.delete()
            return redirect('students')
    except:
        context = {'title':'Datos del Estudiante','student':student,'error':f'Error al eliminar estudiante'}
        return render(request, 'delete_student.html',context)  
       
#crud facultad 
@login_required
def facultad(request):
    context, facultades = None, None
    try:
        q = request.GET.get('q')
        if q:
            facultades = Facultad.objects.filter(description__icontains=q)
        else:
            facultades = Facultad.objects.all()

        paginator = Paginator(facultades, 2)
        page = request.GET.get('page', 1)
        facultades_paginadas = paginator.get_page(page)
        context = {
            'facultades': facultades_paginadas,
            'title': 'Consulta de Facultades',
            'paginator': paginator,
            'num_pages': paginator.num_pages,
        }
        return render(request, 'facultades.html', context)
    except:
        return render(request, 'facultades.html', {'title': 'Consulta de Facultades', 'error': f'Ha ocurrido un error en la consulta'}) 
    
@login_required
def create_facultad(request):
    form = None
    if request.method == "GET":
        context = {'title': 'Registro de Facultad', 'form': FacultadForm(), 'error': ''}
        return render(request, 'create_facultad.html', context)
    else:
        try:
            form = FacultadForm(request.POST)
            print(form)
            print(request.POST)
            if form.is_valid():
                facultad = form.save()
                return redirect('facultades')
            else:
                return render(request, 'create_facultad.html', {"form": form, "error": "Error de datos inválidos."})
        except:
            return render(request, 'create_facultad.html', {"form": form, "error": f"Error al crear la facultad"})

@login_required
def detail_facultad(request, id):
    facultad = None 
    try: 
        facultad = get_object_or_404(Facultad,pk=id) 
        facultad.isactive = False 
        facultad.save()
        return redirect('facultades') 
    except:
        context = {'title':'Datos de la Facultad','facultad':facultad,'error':f'Error al seleccionar facultad'}
        return render(request,'detail_facultad.html',context)

@login_required
def update_facultad(request, id):
    facultad = get_object_or_404(Facultad, pk=id)
    
    form = FacultadForm(instance=facultad)  # Inicializa el formulario con la instancia del objeto Facultad

    if request.method == "GET":
        context = {'title': 'Editar Facultad', 'form': form, 'error': ''}
        return render(request, 'create_facultad.html', context)
    else:
        try:
            form = FacultadForm(request.POST, instance=facultad)
            if form.is_valid():
                form.save()
                return redirect('facultades')
            else:
                return render(request, 'create_facultad.html', {"form": form, "error": "Error de datos inválidos."})
        except:
            return render(request, 'create_facultad.html', {"form": form, "error": f"Error al actualizar la facultad"})
        
@login_required
def delete_facultad(request, id):
    facultad = None
    try:
        facultad = get_object_or_404(Facultad,pk=id)
        if request.method == "GET":
            context = {'title':'Facultad a Eliminar','facultad':facultad,'error':''}
            return render(request,'delete_facultad.html',context)
        else:
            facultad.delete()
            return redirect('facultades')
    except:
        context = {'title':'Datos de la Facultad','facultad':facultad,'error':f'Error al eliminar facultad'}
        return render(request,'delete_facultad.html',context)

#crud carrera
@login_required
def carrera(request):
    context,carreras = None,None 
    try:
        q = request.GET.get('q')
        if q:
            carreras = Carrera.objects.filter(description__icontains=q)
        else:
            carreras = Carrera.objects.all() 
        
        paginator = Paginator(carreras,2)
        page = request.GET.get('page',1)
        carreras_paginadas = paginator.get_page(page)
        context = {
            'carreras':carreras_paginadas,
            'title':'Consulta de Carreras',
            'paginator':paginator,
            'num_pages':paginator.num_pages, 
        } 
        return render(request,'carreras.html',context)
    except:
        return render(request,'carreras.html',{'title':'Consulta de Carreras','error':f'Ha ocurrido un error en la consulta'}) 

@login_required  
def create_carrera(request):
    form = None 
    if request.method == "GET":
        context = {'title':'Registro de Carrera','form':CarreraForm(),'error':''}
        return render(request,'create_carrera.html',context) 
    else:
        try:
            form = CarreraForm(request.POST) 
            print(form)
            print(request.POST)
            if form.is_valid():
                carrera = form.save()
                return redirect('carreras')
            else:
                return render(request,'create_carrera.html',{'form':form,'error':'Error de datos inválidos'})
        except:
            return render(request,'create_carrera.html',{"form": form, "error": f"Error al crear la carrera"})

@login_required
def detail_carrera(request,id):
    carrera = get_object_or_404(Carrera,pk=id)
    if request.method == "POST":
        carrera.isactive = False 
        carrera.save() 
        return redirect('carreras') 
    
    context = {'title':'Datos de la Carrera','carrera':carrera} 
    return render(request,'detail_carrera.html',context)

@login_required
def update_carrera(request,id):
    carrera = get_object_or_404(Carrera,pk=id)
    form = CarreraForm(instance=carrera)

    if request.method == "GET":
        context = {'title':'Editar Carrera','form':form,'error':''}
        return render(request,'create_carrera.html',context) 
    else:
        try:
            form = CarreraForm(request.POST, instance=carrera)
            if form.is_valid():
                form.save()
                return redirect('carreras')
            else:
                return render(request,'create_carrera.html',{'form':form,'error':'Error de datos inválidos'})
        except:
            return render(request,'create_carrera.html',{'form':form,'error':f'Error al actualizar la carrera'})

@login_required
def delete_carrera(request,id):
    carrera = None
    try:
        carrera = get_object_or_404(Carrera,pk=id)
        if request.method == "GET":
            context = {'title':'Carrera a Eliminar','carrera':carrera,'error':''}
            return render(request,'delete_carrera.html',context)
        else:
            carrera.delete()
            return redirect('carreras')
    except:
        context = {'title':'Datos de la Carrera','carrera':carrera,'error':'Error al eliminar carrera'}
        return render(request,'delete_carrera.html',context)

#crud asignatura
@login_required
def asignatura(request):
    context,asignaturas = None,None 
    try:
        q = request.GET.get('q')
        if q:
            asignaturas = Asignatura.objects.filter(name__icontains=q) 
        else:
            asignaturas = Asignatura.objects.all() 

        paginator = Paginator(asignaturas,2)
        page = request.GET.get('page',1)
        asignaturas_paginadas = paginator.get_page(page)

        context = {
            'asignaturas':asignaturas_paginadas,
            'title':'Consulta de Asignaturas',
            'paginator':paginator,
            'num_pages':paginator.num_pages,
        }
        return render(request,'asignaturas.html',context)
    except:
        return render(request,'asignaturas.html',{'title':'Consulta de Asignaturas','error':f'Ha ocurrido un error en la consulta'}) 

@login_required
def create_asignatura(request):
    form = None
    if request.method == "GET":
        context = {'title':'Registro de Asignatura','form':AsignaturaForm(),'error':''} 
        return render(request,'create_asignatura.html',context)
    else:
        try:
            form = AsignaturaForm(request.POST) 
            print(form)
            print(request.POST)
            if form.is_valid():
                asignatura = form.save()
                return redirect('asignaturas')
            else: 
                context = {'form':form,'error':'Error de datos inválidos'}
                return render(request,'create_asignatura.html',context)
        except:
            context = {"form": form, "error": f"Error al crear la asignatura"} 
            return render(request,'create_asignatura.html',context)

@login_required
def detail_asignatura(request,id):
    asignatura = None 
    try:
        asignatura = get_object_or_404(Asignatura,pk=id)
        asignatura.isactive = False 
        asignatura.save() 
        return redirect('asignaturas')
    except:
        context = {'title':'Datos de la Asignatura','asignatura':asignatura,'error':'Error al seleccionar estudiante'}
        return render(request,'detail_asignatura.html',context) 

@login_required
def update_asignatura(request,id):
    asignatura = get_object_or_404(Asignatura,pk=id) 
    form = AsignaturaForm(instance=asignatura) 

    if request.method == "GET":
        context = {'title':'Editar Asignatura','form':form,'error':''}
        return render(request,'create_asignatura.html',context) 
    else:
        try:
            form = AsignaturaForm(request.POST,instance=asignatura)
            if form.is_valid():
                form.save()
                return redirect('asignaturas')
            else:
                context = {'form':form,'error':'Error de datos inválidos'} 
                return render(request,'create_asignatura.html',context)
        except:
            context = {'form':form,'error':f'Error al actualizar la asignatura'} 
            return render(request,'create_asignatura.html',context)

@login_required
def delete_asignatura(request,id):
    asignatura = None 
    try:
        asignatura = get_object_or_404(Asignatura,pk=id) 
        if request.method == "GET":
            context = {'title':'Asignatura a Eliminar','asignatura':asignatura,'error':''} 
            return render(request,'delete_asignatura.html',context) 
        else:
            asignatura.delete() 
            return redirect('asignaturas')
    except:
        context = {'title':'Datos de la Asignatura','asignatura':asignatura,'error':'Error al eliminar asignatura'} 
        return render(request,'delete_asignatura.html',context)

#crud profesor
@login_required
def profesor(request):
    context,profesores=None,None
    try:
        q = request.GET.get('q') # ver
        if q:
            profesores = Profesor.objects.filter(
                Q(lastname__icontains=q) | Q(firstname__icontains=q)
            )
        else:
            profesores = Profesor.objects.all() 
           
        print(profesores)
        paginator = Paginator(profesores,2)
        pagina = request.GET.get('page', 1)  
        profesores_paginados = paginator.get_page(pagina)
   
        context = {
            'profesores': profesores_paginados,
            'title':'Consulta de Docentes',
            'paginator': paginator,
            'num_pages': paginator.num_pages,
        }
      
        return render(request, 'profesores.html',context)
    except:
        return render(request, 'profesores.html',{'title':'Consulta de Docentes','error':f'Ha ocurrido un error en la consulta'})

@login_required
def create_profesor(request):
    form=None
    if request.method == "GET":
        context = {'title':'Registro de Docente','form':ProfesorForm,'error':''}
        return render(request, 'create_profesor.html',context)
    else:
        try:
            form = ProfesorForm(request.POST)
            print(form)
            print(request.POST)
            print(request.user)
            if form.is_valid():
                profesor = form.save(commit=False)
                profesor.user = request.user
                profesor.save() 
                return redirect('profesores')
            else:
                return render(request, 'create_profesor.html', {"form": form, "error": "Error de datos invalidos."}) 
        except:
            return render(request, 'create_profesor.html', {"form": form, "error": "Error al Crear Registro de Docente"})

@login_required
def detail_profesor(request,id):
    profesor=None
    try:
        profesor = Profesor.objects.get(user=request.user,pk=id)
        # select * from stident where user="admin" and id=2
        profesor.isactive = False
        profesor.save()
        return redirect('profesores')
    except:
        context = {'title':'Datos del Docente','profesor':profesor,'error':'Error al seleccionar docente'}
        return render(request, 'detail_docente.html',context)  
    

@login_required
def update_profesor(request,id):
    profesor = Profesor.objects.filter(user=request.user,pk=id).first()
    form=None
    print(profesor)
    if request.method == "GET":
       form = ProfesorForm(instance=profesor)
       context = {'title':'Editar Docente','form':form,'error':''}
       return render(request, 'create_profesor.html',context)
    else:
        try:
            form = ProfesorForm(request.POST,instance=profesor)
            if form.is_valid():
                form.save()
                return redirect('profesores')
            else:
                return render(request, 'create_profesor.html', {"form": form, "error": "Error de datos invalidos."})  
        except:
            return render(request, 'create_profesor.html', {"form": form, "error": "Error al actualizar registro de Docente."})

@login_required
def delete_profesor(request,id):
    profesor=None
    try:
        profesor = Profesor.objects.get(user=request.user,pk=id)
        if request.method == "GET":
            context = {'title':'Docente a Eliminar','student':profesor,'error':''}
            return render(request, 'delete_profesor.html',context)  
        else: 
            profesor.delete()
            return redirect('profesores')
    except:
        context = {'title':'Datos del Docente','student':profesor,'error':'Error al eliminar docente'}
        return render(request, 'delete_profesor.html',context)  
    
#crud semestre
@login_required
def semestre(request):
    context,semestres = None,None 
    try:
        q = request.GET.get('q')
        if q:
            semestres = Semestre.objects.filter(description__icontains=q) 
        else: 
            semestres = Semestre.objects.all()
        
        paginator = Paginator(semestres,2)
        page = request.GET.get('page',1)
        semestres_paginados = paginator.get_page(page)

        context = {
            'semestres':semestres_paginados,
            'title':'Consulta de Semestres',
            'paginator':paginator,
            'num_pages':paginator.num_pages,
        } 
        return render(request,'semestres.html',context)
    except:
        context = {'title':'Consulta de Semestres','error':f'Ha ocurrido un error en la consulta'} 
        return render(request,'semestres.html',context)

@login_required
def create_semestre(request):
    form = None 
    if request.method == "GET": 
        context = {'title':'Registro de Semestre','form':SemestreForm(),'error':''}
        return render(request,'create_semestre.html',context) 
    else:
        try:
            form = SemestreForm(request.POST)  
            print(form) 
            print(request.POST)
            if form.is_valid():
                semestre = form.save()
                return redirect('semestres') 
            else:
                context = {'form':form,'error':'Error de datos inválidos'} 
                return render(request,'create_semestre.html',context)
        except:
            context = {'form':form,'error':f'Error al registrar semestre'} 
            return render(request,'create_semestre.html',context)

@login_required
def detail_semestre(request,id):
    semestre = None 
    try:
        semestre = get_object_or_404(Semestre,pk=id)
        semestre.estado = False 
        semestre.save()
        return redirect('semestres')
    except :
        context = {'title':'Datos del Semestre','nivel':semestre,'error':f'Error al seleccionar nivel'} 
        return render(request,'detail_semestre.html',context)

@login_required
def update_semestre(request,id):
    semestre = get_object_or_404(Semestre,pk=id) 
    form = SemestreForm(instance=semestre) 
    if request.method == "GET":
        context = {'title':'Editar Semestre','form':form,'error':''} 
        return render(request,'create_semestre.html',context) 
    else:
        try:
            form = SemestreForm(request.POST,instance=semestre) 
            if form.is_valid():
                form.save() 
                return redirect('semestres') 
            else:
                context = {'form':form,'error':'Error de datos inválidos'} 
                return render(request,'create_semestre.html',context)
        except:
            context = {'form':form,'error':'Error al actualizar semestre'}
            return render(request,'create_semestre.html',context)

@login_required
def delete_semestre(request,id):
    semestre = None 
    try:
        semestre = get_object_or_404(Semestre,pk=id) 
        if request.method == "GET": 
            context = {'title':'Semestre a Eliminar','nivel':semestre,'error':''} 
            return render(request,'delete_semestre.html',context) 
        else:
            semestre.delete()
            return redirect('semestres')
    except:
        context = {'title':'Datos del Semestre','nivel':semestre,'error':'Error al eliminar semestre'} 
        return render(request,'delete_semestre.html',context) 
    
#crud notas
@login_required
def nota(request):
    context, notas = None, None
    try:
        q = request.GET.get('q')  # ver
        if q:
            notas = Nota.objects.filter(
                Q(user=request.user) & (Q(student__lastname__icontains=q) | Q(student__firstname__icontains=q)) | Q(asignatura__name__icontains=q)
            ) 
        else:
            notas = Nota.objects.filter(user=request.user)

        paginator = Paginator(notas, 2)
        pagina = request.GET.get('page', 1)
        notas_paginadas = paginator.get_page(pagina)

        context = {
            'notas': notas_paginadas,
            'title': 'Consulta de Notas',
            'paginator': paginator,
            'num_pages': paginator.num_pages,
        }

        return render(request, 'notas.html', context)
    except:
        return render(request, 'notas.html', {'title': 'Consulta de Notas', 'error': 'Ha ocurrido un error en la consulta'})

@login_required
def create_nota(request):
    form=None
    if request.method == "GET":
        context = {'title':'Registro de Estudiante','form':NotaForm,'error':''}
        return render(request, 'create_nota.html',context)
    else:
        try:
            form = NotaForm(request.POST)
            print(form)
            print(request.POST)
            print(request.user)
            if form.is_valid():
                nota = form.save(commit=False)# lo tiene en memoria
                nota.user = request.user
                nota.save() # lo guarda en la BD
                return redirect('notas')
            else:
                return render(request, 'create_nota.html', {"form": form, "error": "Error de datos invalidos."}) 
        except:
            return render(request, 'create_nota.html', {"form": form, "error": f"Error al registrar notas"})

@login_required
def detail_nota(request,id):
    nota=None
    try:
        nota = Nota.objects.get(user=request.user,pk=id)
        # select * from stident where user="admin" and id=2
        nota.estado=True
        nota.save()
        return redirect('notas')
    except:
        context = {'title':'Datos de Notas','nota':nota,'error':f'Error al seleccionar nota'}
        return render(request, 'detail_nota.html',context)  
    
@login_required
def update_nota(request,id):
    nota = Nota.objects.filter(user=request.user,pk=id).first()
    form=None
    print(student)
    if request.method == "GET":
       form = NotaForm(instance=nota)
       context = {'title':'Editar Notas','form':form,'error':''}
       return render(request, 'create_nota.html',context)
    else:
        try:
            form = NotaForm(request.POST,instance=nota)
            if form.is_valid():
                form.save()
                return redirect('notas')
            else:
                return render(request, 'create_nota.html', {"form": form, "error": "Error de datos invalidos."})  
        except:
            return render(request, 'create_nota.html', {"form": form, "error": f"Error al actualizar notas"})

@login_required
def delete_nota(request,id):
    nota=None
    try:
        nota = Nota.objects.get(user=request.user,pk=id)
        if request.method == "GET":
            context = {'title':'Notas a Eliminar','nota':nota,'error':''}
            return render(request, 'delete_nota.html',context)  
        else: 
            student.delete()
            return redirect('notas')
    except:
        context = {'title':'Datos de las Notas','nota':nota,'error':f'Error al eliminar notas'}
        return render(request, 'delete_nota.html',context)  
       






