program tpayed2;
uses crt, sysutils;

var
option:char;
access:boolean;
empresas: array[0..9,0..5] of string;
ciudades: array[0..9,0..1] of string;
clientes: array[0..9,0..1] of string;
proyectos: array[0..9,0..4] of string;
contadores: array[0..9,0..0] of integer;
//productos = array[0..10,0] of string;

contEmpresas, contCiudades, contClientes, contProyectos{, contProductos}:integer; 

procedure ordenarCiudades();
	var
		i,k: Integer;
		aux: string;
	begin
		for i := 0 to contCiudades do
      if ciudades[i + 1][0] < ciudades[i][0] then //SE FIJA SI ES MAYOR
        for k := 0 to 1 do
        	//COPIA LOS DATOS DE UNA A OTRA
          begin
            aux := ciudades[i][k];
            ciudades[i][k] := ciudades[i + 1][k];
            ciudades[i + 1][k] := aux;
          end;
	end;

procedure contarCiudades(code:string);
	var
		i: Integer;
	begin
		for i:=0 to contCiudades do 
			if (code = ciudades[i][0]) then
			begin
				contadores[i][0] := contadores[i][0]+1;
				exit();
			end;
	end;

procedure mostrarCiudades();
	var
		max, i, id: Integer;
	begin
		max := 0;
		for i:=0 to contCiudades do
		begin
		writeln(ciudades[i][1]+' - '+inttostr(contadores[i][0]));
			if (contadores[i][0] > max) then
			begin
				max := contadores[i][0];
				id := i;
			end;
		end;
		writeln('La ciudad con mas empresas es '+ciudades[id][1]+', con un total de '+inttostr(contadores[id][0])+' empresas registradas.');
	end;

procedure altaEmpresa();
	var
		pass: boolean;
		i: integer;
	begin
	pass:=false;
	ClrScr();
	writeln('Ingrese el codigo de la empresa.'); //string(3)
	repeat //VALIDACION DE LARGO DEL CODIGO
		readln(empresas[contEmpresas][0]);
		if(length(empresas[contEmpresas][0])<=3) then
			pass:=true
		else
			pass:=false;
			writeln('El codigo debe tener un maximo de 3 caracteres. Ingreselo nuevamente:');
	until(pass=true);
	pass:=false;
	writeln('Ingrese el nombre de la empresa.');
	readln(empresas[contEmpresas][1]);
	writeln('Ingrese la direccion de la empresa.');
	readln(empresas[contEmpresas][2]);
	writeln('Ingrese el mail de la empresa.');
	readln(empresas[contEmpresas][3]);
	writeln('Ingrese el telefono de la empresa.');
	readln(empresas[contEmpresas][4]);
	writeln('Ingrese el codigo de la ciudad');
	repeat //VALIDACION DE SI LA CIUDAD EXISTE
		readln(empresas[contEmpresas][4]);
		for i := 0 to contCiudades do
		begin
			if(ciudades[i][0] = empresas[contEmpresas][4]) then
				pass:=true
		end;
		if(pass=false) then
			writeln('Esa ciudad no existe. Ingreselo nuevamente:');
	until(pass=true);
	contarCiudades(empresas[contEmpresas][4]);
	writeln('Empresa a'+#164+'adida exitosamente, pulse cualquier tecla para volver al menu anterior.');
	readKey();
	contEmpresas := contEmpresas + 1;
	end;

procedure altaCliente();
	begin
		ClrScr();
		writeln('Ingrese el nombre de la ciudad.');
		readln(clientes[contClientes][0]);
		writeln('Ingrese el mail de la empresa.');
		readln(clientes[contClientes][1]);
		writeln('Cliente a'+#164+'adido exitosamente, pulse cualquier tecla para volver al menu anterior.');
		readKey();
		contClientes := contClientes + 1;
	end;

procedure altaCiudad();
	begin
		ClrScr();
		writeln('Ingrese el codigo de la ciudad.');
		readln(ciudades[contCiudades][0]);
		writeln('Ingrese el nombre de la ciudad.');
		readln(ciudades[contCiudades][1]);
		writeln('Ciudad a'+#164+'adida exitosamente, pulse cualquier tecla para volver al menu anterior.');
		ordenarCiudades();
		mostrarCiudades();
		contCiudades := contCiudades+1;
		readKey();
	end;

procedure altaProyecto();
	var
		i: integer;
		pass:boolean;
	begin
		ClrScr();
		writeln('Ingrese el codigo del proyecto.');
		readln(proyectos[contProyectos][0]);
		writeln('Ingrese el codigo de la empresa.');
		repeat //VALIDACION DE SI LA EMPRESA EXISTE
			readln(proyectos[contProyectos][1]);
			for i := 0 to contEmpresas do
			begin
				if(empresas[i][0] = proyectos[contProyectos][1]) then
					pass:=true
			end;
			if(pass=false) then
				writeln('Esa ciudad no existe. Ingreselo nuevamente:')
		until(pass=true);
		pass:=false;
		writeln('Ingrese la etapa del proyecto.'+#13+#10+'P. Preventa'+#13+#10+'O. Obra'+#13+#10+'T. Terminado');
		readln(proyectos[contProyectos][2]);
		writeln('Ingrese el tipo de proyecto.'+#13+#10+'C. Casa'+#13+#10+'D. Departamento'+#13+#10+'O. Oficina'+#13+#10+'L. Lotes');
		readln(proyectos[contProyectos][3]);
		writeln('Ingrese el codigo de la ciudad.');
		repeat //VALIDACION DE SI LA CIUDAD EXISTE
			readln(proyectos[contProyectos][4]);
			for i := 0 to contCiudades do
			begin
				if(ciudades[i][0] = proyectos[contProyectos][4]) then
					pass:=true
			end;
			if(pass=false) then
				writeln('Esa ciudad no existe. Ingreselo nuevamente:')
		until(pass=true);
		writeln('Proyecto a'+#164+'adido exitosamente, pulse cualquier tecla para volver al menu anterior.');
		contProyectos:=contProyectos+1;
		readKey();
	end;

procedure altaProducto();
	begin
		//Unused
	end;

procedure getProyecto(tipo:char); //CAMBIAR!
	begin
		ClrScr();

	end;

procedure showEmpresa();
	var
		opt: char;
begin
	repeat
		ClrScr();
	    writeln('MENU EMPRESAS DESARROLLADORAS:'+#13+#10+'1. Alta de CIUDADES '+#13+#10+'2. Alta de EMPRESAS '+#13+#10+'3. Alta de PROYECTOS'+#13+#10+'4. Alta de Productos '+#13+#10+'0. Volver al menu principal');
	    repeat
	    	opt := readKey();
	    until((opt = '1') or (opt = '2') or (opt = '3') or (opt = '4') or (opt = '0'));
	    case opt of
	    	'1': altaCiudad();
	    	'2': altaEmpresa();
	    	'3': altaProyecto();
	    	'4': altaProducto();
	    end;
	until(opt = '0');
end;
	
procedure showCliente();
	var
		opt, tipo: char;
begin
	repeat
		ClrScr();
		writeln('MENU CLIENTES:'+#13+#10+'1. Alta de Clientes '+#13+#10+'2. Consulta de PROYECTOS'+#13+#10+'0. Volver al menu principal');
		repeat
      opt := readKey();
    until ((opt = '1') or (opt = '2') or (opt = '0'));
    case opt of
	    '1': altaCliente();
	    '2':
    	begin
    		ClrScr();
    	 	writeln('Ingrese el tipo de proyecto que desae buscar.'+#13+#10+'C. Casa'+#13+#10+'D. Departamento'+#13+#10+'O. Oficina'+#13+#10+'L. Lotes');
    	 	tipo := readKey();
    	 	getProyecto(tipo);
    	end;
    end;
  until(opt = '0');
end;

function login(tipo: char): boolean;
var
  attempts: integer;
  clave, secret1, secret2 : string;
  c:char;
begin
  attempts := 3;
  clave := '';
  secret1 := 'admin123';
  secret2 := 'user123';
  while (attempts > 0) do
    begin
      attempts := (attempts-1);
      ClrScr();
      writeln('Ingrese la clave. ', attempts+1, ' intentos restantes');
      repeat
        c := readkey();
        ClrScr();
        writeln('Ingrese la clave. ', attempts+1, ' intentos restantes');
        if(c = #08) then
        	begin
	          delete(clave,length(clave),1);
	          for contEmpresas := 1 to length(clave) do
	            write('*');
        	end
        else
	        begin 
	        	if (c <> #13) then
	        	begin
		            clave := clave + c;
		            for contEmpresas := 1 to length(clave) do
		              write('*')
		        end;
	        end;
      until(c = #13);
      if (tipo = '1') then
      begin
        if (clave = secret1) then
          exit(true)
        else
       	  clave := '';
          writeln('Clave incorrecta');
      end;
      if (tipo = '2') then
      begin
        if (clave = secret2) then
          exit(true)
        else
          clave := '';
          writeln('Clave incorrecta');
      end;
    end;
  writeln('Agotaste los intentos, pulsa cualquier tecla para continuar.');
  readKey();
  ClrScr();
  exit(false);
end;

BEGIN //Main
	contProyectos := 0;
	contCiudades := 3;
	contClientes := 0;
	contEmpresas := 0;
  Ciudades[0][0] := 'BAS';
  Ciudades[0][1] := 'Buenos Aires';
  Ciudades[2][0] := 'CBA';
  Ciudades[2][1] := 'Cordoba';
  Ciudades[1][0] := 'ROS';
  Ciudades[1][1] := 'Rosario';
  repeat
  	ClrScr();
  	writeln('Menu: '+#13+#10+'1. Empresas.'+#13+#10+'2. Clientes.'+#13+#10+'0. Salir'+#13+#10+'');
	   //menu principal
		repeat
      option := readKey();
		until ((option = '1') or (option = '2') or (option = '0'));
		if (option <> '0') then
		begin
		  //login
		  access := login(option);
		  //mostrar submenu
	    if (access) then
	    begin
	       case option of
            '1': showEmpresa();
            '2': showCliente();
	       end;
	    end;
		end;
	until (option = '0');
END.