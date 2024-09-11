from django.shortcuts import render, redirect
from django.db import connection

def LadingPage(request):
    cursor = connection.cursor()
    cursor.execute("CALL listadocategorias()")
    categorias = cursor.fetchall()
    
    # Convertir los resultados en una lista de diccionarios para pasar al template
    categorias = [{'IdCategoria': row[0], 'NombreCategoria': row[1]} for row in categorias]

    return render(request, 'LadingPage.html', {'categorias': categorias})

def insertarcategorias(request):
    if request.method == "POST":
        if request.POST.get('NombreCategoria'):
            insertar = connection.cursor()
            insertar.execute("CALL insertarcategorias(%s)", [request.POST.get('NombreCategoria')])
            return redirect("listadocategorias")
    return render(request, 'listadocategorias')

def listadocategorias(request):
    listado = connection.cursor()
    listado.execute("CALL listadocategorias()")
    categorias = listado.fetchall()
    return render(request, "crud/categorias.html", {"listado": categorias})

def borrarcategoria(request, id_categoria):
    borrar = connection.cursor()
    borrar.execute("CALL borrarcategoria(%s)", [id_categoria])
    return redirect('listadocategorias')

def actualizarcategoria(request, id_categoria):
    if request.method == "POST":
        if request.POST.get('NombreCategoria'):
            actualizar = connection.cursor()
            actualizar.execute("CALL actualizarcategoria(%s, %s)", [id_categoria, request.POST.get('NombreCategoria')])
            return redirect("listadocategorias")
    else:
        categoria = connection.cursor()
        categoria.execute("CALL consultarcategoria(%s)", [id_categoria])
        categoria = categoria.fetchone()
        return render(request, 'crud/editar_categoria.html', {'categoria': categoria})



def perfiles(request):
    return render(request, 'perfiles.html')

def crudCategorias(request):
    return render(request, 'crud/categorias.html')

def crudSubCategorias(request):
    return render(request, 'crud/subcategorias.html')

def crudProductos(request):
    return render(request, 'crud/productos.html')

def crudDomiciliarios(request):
    return render(request, 'crud/domiciliarios.html')

def login(request):
    return render(request, 'login/login.html')

def registro(request):
    return render(request, 'login/registro.html')

def recuperarContraseña(request):
    return render(request, 'login/recuperarcontraseña.html')