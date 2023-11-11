from django.contrib import admin

# Register your models here.
from .models import *

# Register your models here.
class TaskAdmin(admin.ModelAdmin):
  readonly_fields = ('created', )

admin.site.register(Student, TaskAdmin) 
admin.site.register(Asignatura)
admin.site.register(Semestre)
admin.site.register(Profesor) 
admin.site.register(Facultad)
admin.site.register(Carrera) 
admin.site.register(Nota)



