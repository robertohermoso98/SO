#!/bin/bash
startMenu(){
	clear
	starMessage="
	------------------------------------------------\n
	\t     1. Área de clientes\n
	\t     2. Gestión de documentos\n
	\t     3. Gestión de informes\n
	\t     4. Ayuda\n
	\t     5. Salir\n
	------------------------------------------------\n
	Introduzca la selecion correcta :  "

	echo -n -e $starMessage

	read selectionMesage

	while ([ $selectionMesage -gt 4 ] || [ $selectionMesage -lt 1 ])
	do

		clear
		echo -n -e $starMessage
		echo -e "\nError en el numero de menu introducido"
		read selectionMesage
	done
}
customerAreaMenu(){
	customerMessage="
	------------------------------------------------\n
	\t     1. Alta clientes\n
	\t     2. Modificación clientes\n
	\t     3. Baja clientes\n
	\t     4. Consulta clientes (1.4x por cada opción)\n
	\t     5. Salir del menu del clientes\n
	------------------------------------------------\n
	Introduzca la selecion correcta :  "

	echo -n -r $customerAreaMenu

	read selectionCustomer
	
	while ([ $selectionCustomer -gt 4 ] || [ $selectionCustomer -lt 1 ])
	do
		clear
		echo -n -e $customerAreaMenu
		echo -e "\nError en el numero de seleccion"
		read selectionCustomer

	done

}
## alta clientes, modificacion clientes, bajaclientes, consulta clientes(1.4x por cada opcion), salir del menu de clientes


