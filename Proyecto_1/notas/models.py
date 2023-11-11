from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Student(models.Model):
  firstname = models.CharField('Nombres',max_length=200)
  lastname = models.CharField(verbose_name="Apellidos",max_length=200)
  created = models.DateTimeField(auto_now_add=True,blank=False,null=True)
  dategraduate = models.DateTimeField('Fecha Graduacion',null=True, blank=True)
  graduate = models.BooleanField('Graduado',default=False)
  user = models.ForeignKey(User, on_delete=models.CASCADE)
  
  class Meta:
      verbose_name = ('Estudiante')
      verbose_name_plural = ('Estudiantes')
      ordering = ('-lastname',)

  def __str__(self):
    return f"{self.lastname} {self.firstname} - {self.user}"
  
class Facultad(models.Model):
    description = models.CharField('Descripcion',max_length=200)
    isactive = models.BooleanField('Estado',default=True)
    
    class Meta:
      verbose_name = ('Facultad')
      verbose_name_plural = ('Facultades')
      ordering = ('description',)
      
    def __str__(self):
      return f"{self.description}"
  
class Carrera(models.Model):
    facultad = models.ForeignKey(Facultad,on_delete=models.CASCADE)
    description = models.CharField('Descripcion',max_length=200)
    isactive = models.BooleanField('Estado',default=True)
    
    class Meta:
      verbose_name = ('Carrera')
      verbose_name_plural = ('Carreras')
      ordering = ('description',)
      
    def __str__(self):
      return f"{self.description}"
    
class Asignatura(models.Model):
  name = models.CharField('Nombre',max_length=200) 
  isactive = models.BooleanField('Estado',default=True) 

  class Meta:
    verbose_name = ('Asignatura')
    verbose_name_plural = ('Asignaturas')
    ordering = ('name',) 

  def __str__(self):
    return f"{self.name}" 

class Profesor(models.Model):
  firstname = models.CharField('Nombre',max_length=200)
  lastname = models.CharField('Apellido',max_length=200)
  isactive = models.BooleanField('Estado',default=True) 

  class Meta:
    verbose_name = ('Profesor')
    verbose_name_plural = ('Profesores') 
    ordering = ('-lastname',) 

  def __str__(self):
    return f"{self.lastname} {self.firstname}" 

class Semestre(models.Model):
  description = models.CharField('Descripción',max_length=200) 
  dateBegin = models.DateField('Inicio',null=True, blank=True) 
  dateEnd = models.DateField('Fin',null=True, blank=True) 
  estado = models.BooleanField('Estado',default=True)
  
  class Meta:
    verbose_name = ('Semestre') 
    verbose_name_plural = ('Semestres')
    ordering = ('description',) 

  def __str__(self):
    return f"{self.description}" 
  
class Nota(models.Model):
  facultad = models.ForeignKey(Facultad,on_delete=models.CASCADE) 
  carrera = models.ForeignKey(Carrera,on_delete=models.CASCADE) 
  asignatura = models.ForeignKey(Asignatura,on_delete=models.CASCADE) 
  student = models.ForeignKey(Student,on_delete=models.CASCADE) 
  profesor = models.ForeignKey(Profesor,on_delete=models.CASCADE) 
  semestre = models.ForeignKey(Semestre,on_delete=models.CASCADE) 
  nota1 = models.DecimalField('Nota 1',max_digits=5, decimal_places=2)
  nota2 = models.DecimalField('Nota 2',max_digits=5, decimal_places=2)
  notarecuperacion = models.DecimalField('Recuperación',max_digits=5, decimal_places=2)
  promedio = models.DecimalField('Promedio',max_digits=5, decimal_places=2, null=True, blank=True) 
  estado = models.BooleanField('Estado',default=False) 
  user = models.ForeignKey(User, on_delete=models.CASCADE)

  def save(self, *args, **kwargs):
    self.promedio = (self.nota1 + self.nota2 + self.notarecuperacion) 
    super().save(*args, **kwargs) 

  def __str__(self):
    return f"Notas del estudiante {self.student} en {self.asignatura} - {self.user}" 

  class Meta:
    verbose_name = ('Nota')
    verbose_name_plural = ('Notas') 
    ordering = ('student','asignatura') 










