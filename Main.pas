program tpayed2;
uses crt, sysutils;

var
option: char;
access, pass: boolean;
empresas: array[0..9,0..5] of string;
ciudades: array[0..9,0..2] of string;
clientes: array[0..9,0..1] of string;
proyectos: array[0..9,0..5] of string;
contEmpresas, contCiudades, contClientes, contProyectos, i: integer; 

procedure ordenarCiudades();
	var
		k: Integer;
		aux: string;
	begin
		i := contCiudades;
		while (i >= 0) do
			begin
	      if ciudades[i - 1][0] > ciudades[i][0] then //SE FIJA SI ES MAYOR
	        for k := 0 to 2 do
	        	//COPIA LOS DATOS DE UNA A OTRA
	          begin
	            aux := ciudades[i][k];
	            ciudades[i][k] := ciudades[i - 1][k];
	            ciudades[i - 1][k] := aux;
	          end;
	      i := i - 1;
      end;
	end;

procedure mostrarCiudades();
	var
		max, id: Integer;
	begin
		max := 0;
		id := 0;
		for i := 0 to contCiudades do
			begin
				writeln(ciudades[i][1] + ' - ' + ciudades[i][2]);
				if ciudades[i][2] <> '' then
					begin
						if StrToInt(ciudades[i][2]) > max then
							begin
								max := StrToInt(ciudades[i][2]);
								id := i;
							end;
						end;
					end;

		writeln('La ciudad con mas empresas es '+ciudades[id][1]+', con un total de '+ciudades[id][2]+' empresas registradas.');
		readkey;
	end;

procedure altaEmpresa();
	var
		opt, cod, telefono: string;
		c: char;
	begin
		repeat
			ClrScr;
			pass := true; //Hacete que se repita el ingreso si el codigo es invalido.
      writeln(Utf8ToAnsi('Ingrese el código de la empresa.'));
      readln(cod);
      for i := 0 to contEmpresas-1 do
          begin
              if cod = empresas[i][0] then //verifica que el codigo no exista.
                  pass := false
              else
              		writeln(Utf8ToAnsi('Error: Ese código ya existe!'));
              		readKey;
          end;
      if ((length(cod) > 3) or (length(cod) < 1)) then //Verigica el largo de lcodigo.
        begin
            pass := false;
            writeln(Utf8ToAnsi('Error: El código debe tener entre 1 y 3 caracteres.'));
            readKey;
        end;
	  until (pass = true);
	  empresas[contEmpresas][0] := cod;
	  ClrScr;

		writeln('Ingrese el nombre de la empresa.');
		readln(empresas[contEmpresas][1]);
		ClrScr;

		writeln('Ingrese la direccion de la empresa.');
		readln(empresas[contEmpresas][2]);
		ClrScr;

		repeat
			ClrScr;
			writeln('Ingrese el mail de la empresa.');
			readln(empresas[contEmpresas][3]);
			for c in empresas[contEmpresas][3] do 
			begin
				pass := c in ['@'];
				if pass then Break;
			end;
		until (pass = true);

		repeat
			ClrScr;
			pass := true;
			writeln('Ingrese el telefono de la empresa.');
			readln(telefono);
			for c in telefono do
				begin
					pass := c in ['0'..'9'];
					if not pass then
					begin
						writeln('Error: Ese telefono no es valido!');
						Break;
					end;
				end;
		until (pass=true);
		empresas[contEmpresas][4] := telefono;

		// repeat
		// 	ClrScr;
		// 	pass := true;
		// 	writeln('Ingrese el telefono de la empresa.');
		// 	readln(telefono);
		// 	for i := 0 to length(telefono) do
	 //        begin
	 //            if (telefono[i] > '9') or (telefono[i] < '0') then //CAMBIR, NO ANDA
	 //                pass := false;
	 //        end;
	 //    if pass = false then
	 //    	begin
		//     	writeln('Error: Ese telefono no es valido!');
		//     	readKey;
		//    	end;
		// until (pass=true);
		// empresas[contEmpresas][4] := telefono;
		
		repeat
			ClrScr;
			writeLn('Selecciona una ciudad');
			for i := 0 to contCiudades-1 do
				writeLn(IntToStr(i+1) + '. ' + ciudades[i,1]); //ESCRIBE LAS OPCIONES
			readln(opt); //LEE LA OPCION
		until (StrToInt(opt) <= contCiudades);

		for i := 0 to contCiudades-1 do
			begin
				if opt = IntToStr(i) then
					begin
						empresas[contEmpresas][5] := ciudades[i,0]; //Asigna el codigo de ciudad a la empresa.
						ciudades[i][2] := IntToStr(StrToInt(ciudades[i][2]) + 1); //Añade 1 al contador de empresas de la ciudad.
					end;
			end;

		writeln(Utf8ToAnsi('Empresa añadida exitosamente, pulse cualquier tecla para volver al menu anterior.'));
		readKey;
		contEmpresas := contEmpresas + 1;
	end;

procedure altaCliente();
	begin
		ClrScr;
		writeln('Ingrese el nombre del cliente.');
		readln(clientes[contClientes][0]);
		ClrScr;

		writeln('Ingrese el mail del cliente.');
		readln(clientes[contClientes][1]);
		ClrScr;

		writeln(Utf8ToAnsi('Cliente añadido exitosamente, pulse cualquier tecla para volver al menu anterior.'));
		readKey;
		contClientes := contClientes + 1;
	end;

procedure altaCiudad();
	var
		cod: string;
	begin
		repeat
			ClrScr;
			pass := true; //Hacete que se repita el ingreso si el codigo es invalido.
      writeln(Utf8ToAnsi('Ingrese el código de la ciudad.'));
      readln(cod);
      for i := 0 to contCiudades-1 do
          begin
              if cod = ciudades[i][0] then //verifica que el codigo no exista.
                  pass := false
              else
              		writeln(Utf8ToAnsi('Ese código ya existe!'));
          end;
      if ((length(cod) > 3) or (length(cod) < 1)) then //Verigica el largo de lcodigo.
        begin
            pass := false;
            writeln(Utf8ToAnsi('El código debe tener un maximo de 3 caracteres.'));
        end;
	  until (pass = true);
	  ciudades[contCiudades][0] := cod;

		writeln('Ingrese el nombre de la ciudad.');
		readln(ciudades[contCiudades][1]);

		writeln(Utf8ToAnsi('Ciudad añadida exitosamente, pulse cualquier tecla para volver al menu anterior.'));
		ciudades[contCiudades][2] := '0';
		ordenarCiudades();
		contCiudades := contCiudades + 1;
		readKey;
	end;

procedure altaProyecto();
	var
		opt: string;
	begin
		ClrScr;
		writeln(Utf8ToAnsi('Ingrese el código del proyecto.'));
		repeat //VALIDACION DE LARGO DEL CÓDIGO
			readln(proyectos[contProyectos][0]);
			if length(proyectos[contProyectos][0]) <= 3 then
				pass := true
			else
				writeln(Utf8ToAnsi('El código debe tener un maximo de 3 caracteres. Ingreselo nuevamente:'));
		until(pass = true);
		pass := false;
		ClrScr;

		repeat
			writeln('Seleccione una empresa.');
			for i := 0 to contEmpresas-1 do
				writeLn(IntToStr(i+1) + '. ' + empresas[i,1]); //ESCRIBE LAS OPCIONES
		
			readln(opt); //LEE LA OPCION
			ClrScr;
		until (StrToInt(opt) <= contEmpresas);

		for i := 0 to contEmpresas-1 do
			begin
				if opt = IntToStr(i+1) then
					proyectos[contProyectos][2] := empresas[i,0]; //Guarda el codigo de la empresa en el proyecto.
			end;

		repeat
			writeln('Ingrese la etapa del proyecto.'+#13+#10+'P. Preventa'+#13+#10+'O. Obra'+#13+#10+'T. Terminado');
			readln(proyectos[contProyectos][2]);
			ClrScr;
		until (proyectos[contProyectos][2] = 'P') or (proyectos[contProyectos][2] = 'O') or (proyectos[contProyectos][2] = 'T');
		
		repeat
			writeln('Ingrese el tipo de proyecto.'+#13+#10+'C. Casa'+#13+#10+'D. Departamento'+#13+#10+'O. Oficina'+#13+#10+'L. Lotes');
			readln(proyectos[contProyectos][3]);
			ClrScr;
		until (proyectos[contProyectos][3] = 'C' ) or (proyectos[contProyectos][3] = 'D' ) or 
			(proyectos[contProyectos][3] = 'O' ) or (proyectos[contProyectos][3] = 'L' );

		repeat
			writeln('Seleccione una ciudad.');
			for i := 0 to contCiudades-1 do
				writeLn(IntToStr(i+1) + '. ' + ciudades[i,1]); //ESCRIBE LAS OPCIONES
		
			readln(opt); //LEE LA OPCION
			ClrScr;
		until (StrToInt(opt) <= contCiudades);

		for i := 0 to contCiudades-1 do
			begin
				if opt = IntToStr(i+1) then
					proyectos[contProyectos][4] := ciudades[i,0]; //Asigna la ciudad al proyecto
			end;

		writeln(Utf8ToAnsi('Proyecto añadido exitosamente, pulse cualquier tecla para volver al menu anterior.'));
		contProyectos := contProyectos + 1;
		readKey;
	end;

procedure mostrarProyecto();
var
	i, j: integer;
	opt: char;
begin
	ClrScr;
	repeat
		writeLn(Utf8ToAnsi('¿Que tipo de proyecto quieres consultar?'+#13+#10+'C. Casa'+#13+#10+'D. Edificio departamentado'
			+#13+#10+'O. Edificio oficina'+#13+#10+'L. Loteos respectivamente'));
		opt := readKey;
		ClrScr;
	until (opt = 'C') or (opt = 'D') or (opt = 'O') or (opt = 'L');

	for i := 0 to contProyectos do
		begin
			if proyectos[i,3] = opt then
				begin
					writeln(Utf8ToAnsi('Código de proyecto: ') + proyectos[i][0]);
					for j := 0 to contEmpresas do
						if empresas[j,0] = proyectos[i,1] then 
							writeln('Empresa: '+ empresas[i][1]);
					case proyectos[i,2] of
						'P': writeln('Etapa: Preventa');
						'O': writeln('Etapa: Obra');
						'T': writeln('Etapa: Terminado');
					end;
					case proyectos[i,3] of
						'C': writeln('Tipo: Casa');
						'D': writeln('Tipo: Departamento');
						'O': writeln('Tipo: Oficina');
						'L': writeln('Tipo: Lote');
					end;
					for j := 0 to contCiudades do
						if ciudades[j,0] = proyectos[i,4] then 
							begin
								writeln('Ciudad: '+ ciudades[i,1]);
							end;
					writeln('Cantidad: '+ proyectos[i][5]);
				end;	
		end;

	writeln('Toque cualquier tecla para continuar');
	readKey;
end;

procedure showEmpresa();
	var
		opt: char;
begin
	repeat
		ClrScr;
	    writeln(Utf8ToAnsi('MENÚ EMPRESAS DESARROLLADORAS:'+#13+#10+'1. Alta de CIUDADES '+#13+#10+'2. Alta de EMPRESAS '+#13+#10+'3. Alta de PROYECTOS'+#13+#10+'4. Alta de PRODUCTOS (mantenimiento)'+#13+#10+'5. Mostrar Ciudades'+#13+#10+'0. Volver al menú principal'));
	    repeat
	    	opt := readKey;
	    until (opt = '1') or (opt = '2') or (opt = '3') or (opt = '4') or (opt = '0') or (opt = '5');
	    case opt of
	    	'1': altaCiudad();
	    	'2': altaEmpresa();
	    	'3': altaProyecto();
	    	'4': ;
	    	'5': mostrarCiudades();
	    end;
	until (opt = '0');
end;
	
procedure showCliente();
	var
		opt: char;
begin
	repeat
		ClrScr;
		writeln(Utf8ToAnsi('MENÚ CLIENTES:'+#13+#10+'1. Alta de CLIENTES '+#13+#10+'2. Consulta de PROYECTOS'+#13+#10+'0. Volver al menú principal'));
		repeat
      opt := readKey;
    until (opt = '1') or (opt = '2') or (opt = '0');
    case opt of
	    '1': altaCliente();
	    '2': mostrarProyecto();
    end;
  until (opt = '0');
end;

function login(tipo: char): boolean;
var
  attempts: integer;
  clave, secret1, secret2 : string;
  c: char;
begin
  attempts := 3;
  clave := '';
  secret1 := 'admin123';
  secret2 := 'user123';
  while (attempts > 0) do
    begin
      attempts := (attempts-1);
      ClrScr;
      writeln('Ingrese la clave. ', attempts + 1, ' intentos restantes');
      repeat
        c := readKey;
        ClrScr;
        writeln('Ingrese la clave. ', attempts + 1, ' intentos restantes');
        if c = #08 then
        	begin
	          delete(clave,length(clave),1);
	          for i := 1 to length(clave) do
	            write('*');
        	end
        else
	        begin 
	        	if c <> #13 then
	        		begin
		            	clave := clave + c;
		            	for i := 1 to length(clave) do
		              	write('*')
		        	end;
	        end;
      until (c = #13);
      if tipo = '1' then
      	begin
        	if (clave = secret1) then
          	exit(true)
        	else
       	  	clave := '';
          	writeln('Clave incorrecta');
      	end;
      if tipo = '2' then
      	begin
        	if clave = secret2 then
          	exit(true)
        	else
          	clave := '';
          	writeln('Clave incorrecta');
      	end;
    end;
  writeln('Agotaste los intentos, programa bloqueado temporalmente.');
  Halt(0);
  exit(false);
end;

begin //Main
	//Valores de testeo:
	contProyectos := 1;
	contCiudades := 3;
	contClientes := 0;
	contEmpresas := 1;
	proyectos[0][0] := 'Pr1';
	proyectos[0][1] := 'Co1';
	proyectos[0][2] := 'P';
	proyectos[0][3] := 'C';
	proyectos[0][4] := 'CBA';
	proyectos[0][5] := '2';
  ciudades[0][0] := 'BAS';
  ciudades[0][1] := 'Buenos Aires';
  ciudades[0][2] := '0';
  ciudades[1][0] := 'ROS';
  ciudades[1][1] := 'Rosario';
  ciudades[1][2] := '0';
  ciudades[2][0] := 'CBA';
  ciudades[2][1] := 'Cordoba';
  ciudades[2][2] := '0';
  empresas[0,0] := 'Co1';
	empresas[0,1] := 'Empresa 1';
	empresas[0,2] := 'Zeballos 1341';
	empresas[0,3] := 'empresa@ejemplo.com';
	empresas[0,4] := '4583818';
	empresas[0,5] := 'BAS'; 

  repeat
  	ClrScr;
  	writeln(Utf8ToAnsi('MENÚ PRINCIPAL: '+#13+#10+'1. EMPRESAS'+#13+#10+'2. CLIENTES'+#13+#10+'0. Salir'+#13+#10));
	   //menu principal
		repeat
      option := readKey;
		until (option = '1') or (option = '2') or (option = '0');
		if option <> '0' then
			begin
			  //login
			  access := login(option);
		    if access then
			    begin
			       case option of
		            '1': showEmpresa();
		            '2': showCliente();
			       end;
			    end;
			end;
	until (option = '0');
end.
