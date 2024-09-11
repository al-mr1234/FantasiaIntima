from django.db import models

class categoria(models.Model):
    NombreCategoria = models.CharField(max_length=80)
    class Meta:
        db_table = 'categoria'
