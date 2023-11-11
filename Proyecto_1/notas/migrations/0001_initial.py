# Generated by Django 4.2.7 on 2023-11-11 00:27

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Asignatura',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, verbose_name='Nombre')),
                ('isactive', models.BooleanField(default=True, verbose_name='Estado')),
            ],
            options={
                'verbose_name': 'Asignatura',
                'verbose_name_plural': 'Asignaturas',
                'ordering': ('name',),
            },
        ),
        migrations.CreateModel(
            name='Carrera',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=200, verbose_name='Descripcion')),
                ('isactive', models.BooleanField(default=True, verbose_name='Estado')),
            ],
            options={
                'verbose_name': 'Carrera',
                'verbose_name_plural': 'Carreras',
                'ordering': ('description',),
            },
        ),
        migrations.CreateModel(
            name='Facultad',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=200, verbose_name='Descripcion')),
                ('isactive', models.BooleanField(default=True, verbose_name='Estado')),
            ],
            options={
                'verbose_name': 'Facultad',
                'verbose_name_plural': 'Facultades',
                'ordering': ('description',),
            },
        ),
        migrations.CreateModel(
            name='Profesor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstname', models.CharField(max_length=200, verbose_name='Nombre')),
                ('lastname', models.CharField(max_length=200, verbose_name='Apellido')),
                ('isactive', models.BooleanField(default=True, verbose_name='Estado')),
            ],
            options={
                'verbose_name': 'Profesor',
                'verbose_name_plural': 'Profesores',
                'ordering': ('-lastname',),
            },
        ),
        migrations.CreateModel(
            name='Semestre',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=200, verbose_name='Descripción')),
                ('dateBegin', models.DateField(blank=True, null=True, verbose_name='Inicio')),
                ('dateEnd', models.DateField(blank=True, null=True, verbose_name='Fin')),
                ('estado', models.BooleanField(default=True, verbose_name='Estado')),
            ],
            options={
                'verbose_name': 'Semestre',
                'verbose_name_plural': 'Semestres',
                'ordering': ('description',),
            },
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('firstname', models.CharField(max_length=200, verbose_name='Nombres')),
                ('lastname', models.CharField(max_length=200, verbose_name='Apellidos')),
                ('created', models.DateTimeField(auto_now_add=True, null=True)),
                ('dategraduate', models.DateTimeField(blank=True, null=True, verbose_name='Fecha Graduacion')),
                ('graduate', models.BooleanField(default=False, verbose_name='Graduado')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Estudiante',
                'verbose_name_plural': 'Estudiantes',
                'ordering': ('-lastname',),
            },
        ),
        migrations.CreateModel(
            name='Nota',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nota1', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='Nota 1')),
                ('nota2', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='Nota 2')),
                ('notarecuperacion', models.DecimalField(decimal_places=2, max_digits=5, verbose_name='Recuperación')),
                ('promedio', models.DecimalField(blank=True, decimal_places=2, max_digits=5, null=True, verbose_name='Promedio')),
                ('estado', models.BooleanField(default=False, verbose_name='Estado')),
                ('asignatura', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notas.asignatura')),
                ('carrera', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notas.carrera')),
                ('facultad', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notas.facultad')),
                ('profesor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notas.profesor')),
                ('semestre', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notas.semestre')),
                ('student', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notas.student')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Nota',
                'verbose_name_plural': 'Notas',
                'ordering': ('student', 'asignatura'),
            },
        ),
        migrations.AddField(
            model_name='carrera',
            name='facultad',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notas.facultad'),
        ),
    ]