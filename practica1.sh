#!/bin/bash

esNumero='^-?[0-9]+([.][0-9]+)?$'
noEsNumero="[a-zA-Z]*$"



######################################################################################################
######################################################################################################
#######################################   MENU PRINCIPAL #############################################

startMenu(){ # menu principal de clientes este modelo es le mismo para todos los menus del programa
	# la diferencias son las opciones que puede hacer pero el modelo es el mismo

	clear
	# mensaje principal del munu
	starMessage="
	------------------------------------------------\n
	\t     1. Área de clientes\n
	\t     2. Gestión de documentos\n
	\t     3. Gestión de informes\n
	\t     4. Ayuda\n
	\t     5. Salir\n
	------------------------------------------------\n
	Introduzca la selecion correcta :  "

	echo -n -e $starMessage  # mostramos el mensaje

	read selectionMesage # leemos la respuesta del cliente

	
	while [ $selectionMesage != "5" ]	
	do
		while [[ ! $selectionMesage =~ $esNumero ]] || ([ $selectionMesage -gt 4 ] || [ $selectionMesage -lt 1 ])
		do
			clear
			echo -n -e $starMessage
			echo -e "\nError en el numero de seleccion"
			read selectionMesage 
		done
		case $selectionMesage in
			1)
				customerAreaMenu
				;;
			2)
			documentsMenu
				;;
			3)
				;;
			4)
				;;
			5)
				;;
		esac
		echo -n -e $starMessage
		read selectionMesage 
		clear

	done
}
##################################################################################################
#                                 GNERACION DE CLIENTES
generarId(){  # esta funcion nos regresa el id que toque añadir osea el ultimo mas 1
	if [ -f "clientes.txt" ]
	then
		id=`tail -1 "clientes.txt" | cut -f1 -d:`
		id=$(($id + 1))
		return $id
	else
		echo "No existe el nombre del fichero"
	fi
}
altaCientes(){ # esta funcion genera los datos del cliente y los graba en el fichero clientes.txt
	echo "---- Generador de clientes ----"
	# generamos el id
	generarId
	id=$?
	# pedimos la introduccion de todos los demas datos
	echo "Se te ha asignado el id : $id"
	read -p "Introduzca nombre : " customerName 
	read -p "Introduzca apellidos : " customerLastName
	read -p "Introduzca direccion : " customerAddres
	read -p "Introduzca ciudad : " customerCity
	read -p "Introduzca provincia : " customerProvince
	read -p "Introduzca país : " customerContry
	read -p "Introduzca dni : " customerDNI
	read -p "Introduzca telefono : " customerTelephone ## se deja conom alfanumero por la posiblildad de añadir un numero tipo +34 63453454
	carpetadoc="$id""_Doc"
	# generamos la cadena de texto completa
	cliente="$id"":""$customerName"":""$customerLastName"":""$customerAddres"":""$customerCity"":""$customerProvince"":""$customerContry"":""$customerDNI"":""$customerTelephone"":""$carpetadoc"":""S"
	# informamos de que se ha generado todo correctamente
	echo "Cliente generado correcatemente como $customerName $customerLastName "
	echo "Datos de cliente -> $cliente"
	# preguntamos al cliente si desesa guradar los datos o reintroducirlos
	read -p "En el caso de que sean correctos los datos y desee guardarlos seleccione s/S en caso contrario n/N : " opcionGuardar
	while [ $opcionGuardar != "s" ] && [ $opcionGuardar != "S" ] && [ $opcionGuardar != "n" ] && [ $opcionGuardar != "N" ]
 	do 
		read -p "Opcion incorrecta introduzca s/S o n/N : " opcionGuardar
	done
	if [ $opcionGuardar == "s" ] || [ $opcionGuardar == "S" ]
	then
		# guardamos en le archivo
		echo -e $cliente >> clientes.txt
		echo  "Cliente guardado con exito"
	else
		# no guardamos
		echo "No se guardo el cliente "
	fi
}
###############################################################################################
#                             MODIFICACION DE CLIENTES
modificarDatoCliente(){

	dato=$1
	tipo=$2

	echo "dato """$dato"" tipo """$tipo"
	# podemos uscar aciendo :
	# grep "$dato" clientes.txt | cut -f8 -d":"
	# eso nos daria la linea
	# o pedemos buscar por el id 
	# lo primero es buscar la linea donde se encuentra el usuario
	sed -i "1s/.*/$dato/" clientes.txt
	read datooo
}
modificacionClientes(){
	mensajeMod="Datos del clientes modificables \n
	\t    1 Nombre de cliente \n
	\t    2 Apellidos de cliente \n
	\t    3 Dirección de cliente \n
	\t    4 Ciudad de cliente \n
	\t    5 Provincia cliente \n 
	\t    6 País cliente \n 
	\t    7 DNI cliente \n 
	\t    8 Telefono Cliente \n
	Marque la opcion que desea modificar : \n"

	echo -n -e $mensajeMod
	read selectionModCustomer


	while [[ ! $selectionModCustomer =~ $esNumero ]] || ([ $selectionModCustomer -gt 8 ] || [ $selectionModCustomer -lt 1 ])
	do
		clear
		echo -n -e $mensajeMod
		echo -e "\nError en el numero de seleccion"
		read selectionCustomer
	done


	case $selectionModCustomer in
		1)
			read -p "Introduzca el nombre : " customer
			modificarDatoCliente $customer 1
			;;
		2)
			read -p "Introduzca el apellido : " customer
			modificarDatoCliente $customer 2
			;;
		3)
			read -p "Introduzca la direccion : " customer
			modificarDatoCliente $customer 3
			;;
		4)
			read -p "Introduzca la ciudad : " customer
			modificarDatoCliente $customer 4
			;;
		5)
			read -p "Introduzca la provincia : " customer
			modificarDatoCliente $customer 5
			;;
		6)
			read -p "Introduzca el pais : " customer
			modificarDatoCliente $customer 6
			;;
		7)
			read -p "Introduzca el DNI : " customer
			modificarDatoCliente $customer 7
			;;
		8)
			read -p "Introduzca el telefono : " customer
			modificarDatoCliente $customer 8
			;;
	esac

}

######################################################################################################
#                       ##################  MENU DE CLIENTES #########KJ################
customerAreaMenu(){
	clear
	customerAreaMenu="
	------------------------------------------------\n
	\t     1. Alta clientes\n
	\t     2. Modificación clientes\n
	\t     3. Baja clientes\n
	\t     4. Consulta clientes (1.4x por cada opción)\n
	\t     5. Salir del menu del clientes\n
	------------------------------------------------\n
	Introduzca la selecion correcta :  "
	
	echo -n -e $customerAreaMenu

	read selectionCustomer

	while [ $selectionCustomer != "5" ]	
	do
		while [[ ! $selectionCustomer =~ $esNumero ]] || ([ $selectionCustomer -gt 4 ] || [ $selectionCustomer -lt 1 ])
		do
			clear
			echo -n -e $customerAreaMenu
			echo -e "\nError en el numero de seleccion"
			read selectionCustomer
		done
		case $selectionCustomer in
			1)
				altaCientes
				;;
			2)
				modificacionClientes
				;;
			3)
				;;
			4)
				;;
			5)
				;;
		esac
		echo -n -e $customerAreaMenu
		read selectionCustomer
		clear
	done

		
}
############################################################################################
#              ####################### MENU DE DOCUMENTOS  ###############################
documentsMenu(){
	clear
	documentsMessage="
	------------------------------------------------\n
	\t     1. Alta documentos\n
	\t     2. Baja documentos\n
	\t     3. Presentación documentos\n
	\t     4. Consultas (2.4x por cada opción)\n
	\t     5. Salir del menu de documetos \n
	------------------------------------------------\n
	Introduzca la selecion correcta :  "
	
	echo -n -e $documentsMessage 
	
	read selecctionDocuments

	while [ $selecctionDocuments != "5" ]	
	do
		while [[ ! $selecctionDocuments =~ $esNumero ]] || ([ $selecctionDocuments -gt 4 ] || [ $selecctionDocuments -lt 1 ])
		do
			clear
			echo -n -e $documentsMessage 
			echo -e "\nError en el numero de seleccion"
			read selecctionDocuments  
		done
		case $selecctionDocuments in
			1)
				;;
			2)
				;;
			3)
				;;
			4)
				;;
			5)
				;;
		esac
		echo -n -e $customerAreaMenu
		read selectionCustomer
		clear
	done

}


startMenu
## startMenu 
