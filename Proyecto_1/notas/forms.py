from django.forms import ModelForm
from .models import *

class StudentForm(ModelForm):
    class Meta:
        model = Student
        fields = ['firstname', 'lastname', 'dategraduate', 'graduate']
        
class FacultadForm(ModelForm):
    class Meta:
        model = Facultad
        fields = ['description', 'isactive'] 

class CarreraForm(ModelForm):
    class Meta:
        model = Carrera 
        fields = ['facultad','description','isactive']

class AsignaturaForm(ModelForm):
    class Meta:
        model = Asignatura
        fields = ['name','isactive']

class ProfesorForm(ModelForm):
    class Meta:
        model = Profesor 
        fields = ['firstname','lastname','isactive']

class SemestreForm(ModelForm):
    class Meta:
        model = Semestre
        fields = ['description','dateBegin','dateEnd','estado']

class NotaForm(ModelForm):
    class Meta:
        model = Nota
        fields = [
            'facultad', 
            'carrera',
            'asignatura',
            'student',
            'profesor',
            'semestre',
            'nota1',
            'nota2',
            'notarecuperacion',
            'promedio',
            'estado'
        ]
