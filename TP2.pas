Program TP2;
uses crt, sysutils;
var
	menuOption: char;
	accType, i, j, k, countCompanies, countCities, countClients, countProjects: integer;
	response: boolean;
	arrayCompanies: array [0..100,0..5] of string;
	arrayCities: array [0..100,0..2] of string;
	arrayClients: array [0..100,0..2] of string;
	arrayProjects: array [0..100,0..5] of string;

function auth(accType : String): boolean;
var
	generatedPass, inputPass: string;
	ch: char;
	i: integer;

procedure insertPass();
var
	cont, i: integer;
begin
	i := -1;
	inputPass := '';

  		repeat
   			begin
   				ch:= readkey;
   				ClrScr;
				Sound(700);
  				Delay(100);
  				NoSound;
  				
  				if (ch <> #13) then
  					begin
  						if (ch = #08) then
  							begin
  								i:= i - 1;
  								delete(inputPass,length(inputPass),1);
  								for cont := 0 to i do 
   									begin
   										write('*');
   									end;
  							end
  						else
  							begin
  								i:= i + 1;
  								inputPass:= inputPass + ch;
   								for cont := 0 to i do 
   									begin
   										write('*');
   									end;
  							end
  					end
  				
  			end;
  		until (ch = #13) or (i = 10);
end;

begin
	writeLn('Ingresar clave');
	insertPass();

	if(accType = 'E') then
		begin
			generatedPass:= 'E';
		end
	else
		begin
			generatedPass:= 'C';
		end;
	if (inputPass = generatedPass) then
		begin
			auth:= true;
		end
	else
		begin
			i:= 1;
			while not (inputPass = generatedPass) and (i <= 3) do
				begin
					ClrScr;
				 	writeLn('Clave invalida, prueba nuevamente (',i,'/3)');
				 	insertPass();
				 	i:= i + 1;
				 	ClrScr;
				 end;
			if (inputPass <> generatedPass) then
				begin
					auth:= false;
				end
			else if (inputPass = generatedPass) then
				begin
					auth:= true;
				end
		end;
end;

procedure company();

procedure cities();
var
	finishUpload, aux: string;
begin
	repeat
		repeat
			begin
				writeLn('Ingresa el codigo de la ciudad');
				readLn(arrayCities[countCities][0]);
				ClrScr;
			end
		until (length(arrayCities[countCities][0]) < 4);
		writeLn('Ingresa el nombre de la ciudad');
		readLn(arrayCities[countCities][1]);
		ClrScr;

		countCities := countCities + 1;

		repeat
			writeLn('¿Quieres seguir cargando ciudades? Ingresa SI o NO');
			readLn(finishUpload);
			ClrScr;
		until (finishUpload = 'SI') or (finishUpload = 'NO');

		for i := 0 to countCities do
			if arrayCities[i + 1, 0] < arrayCities[i, 0] then
				for k := 0 to 1 do
					begin
						aux := arrayCities[i,k];
						arrayCities[i,k] := arrayCities[i + 1,k];
						arrayCities[i + 1,k] := aux;
					end;

		// for i := 0 to countCities - 1 do
		// 	for j := i + 1 to countCities do
		// 		if arrayCities[i,0] > arrayCities[j,0] then
		// 			for k := 0 to 1 do
		// 				begin
		// 					aux := arrayCities[i,k];
		// 					arrayCities[i,k] := arrayCities[j,k];
		// 					arrayCities[j,k] := aux;
		// 				end;

		for i := 0 to countCities do
			begin
			for j := 0 to 2 do
				write(arrayCities[i,j]+' ');
				writeLn;
			end;

	until (finishUpload = 'NO')
end;

procedure companies();
var
	countRos, countCba, countBas: integer;
	inputCity, finishUpload: string;
begin
	countRos := 0;
	countCba := 0;
	countBas := 0;

	repeat
		repeat
			begin
				writeLn('Ingresa el codigo de la empresa');
				readLn(arrayCompanies[countCompanies][0]);
				ClrScr;
			end
		until (length(arrayCities[countCities][0]) < 4);
		ClrScr;
		writeLn('Ingresa el nombre de la empresa');
		readLn(arrayCompanies[countCompanies][1]);
		ClrScr;
		writeLn('Ingresa la dirección de la empresa');
		readLn(arrayCompanies[countCompanies][2]);
		ClrScr;
		writeLn('Ingresa el mail de la empresa');
		readLn(arrayCompanies[countCompanies][3]);
		ClrScr;
		writeLn('Ingresa el teléfono de la empresa');
		readLn(arrayCompanies[countCompanies][4]);
		ClrScr;

		writeLn('Selecciona una ciudad');
		for i := 0 to countCities-1 do
			begin
				writeLn(IntToStr(i+1) + '. ' + arrayCities[i,1]);
			end;
		menuOption:= readKey;
		ClrScr;

		for i := 0 to countCities-1 do
			begin
				if (menuOption = IntToStr(i+1)) then
					begin
						arrayCompanies[countCompanies][4] := arrayCities[i,0];
						writeLn(IntToStr(i+1)+ '. ' +IntToStr(i+1) + '. ' + arrayCities[i,1]);
					end
			end;
		ClrScr;

		countCompanies := countCompanies + 1;

		repeat
			writeLn('¿Quieres seguir cargando empresas? Ingresa SI o NO');
			readLn(finishUpload);
			ClrScr;
		until (finishUpload = 'SI') or (finishUpload = 'NO');

		for i := 0 to countCompanies do
			begin
			for j := 0 to 5 do
				write(arrayCompanies[i,j]+' ');
				writeLn;
			end;

		case inputCity of
			'ROS': countRos:= countRos + 1;
			'CBA': countCba:= countCba + 1;
			'BAS': countBas:= countBas + 1;
		end
	until (finishUpload = 'NO');
	writeLn('ROS tiene: ',countRos,' CBA tiene: ',countCba,' BAS tiene: ',countBas);
	if countRos > countCba then
		begin
			if countRos > countBas then
				writeLn('Rosario tiene mayor cantidad')
			else
				writeLn('Buenos Aires tiene mayor cantidad')
		end
	else
		begin
			if countCba > countBas then
				writeLn('Cordoba tiene mayor cantidad')
			else
				writeLn('Buenos Aires tiene mayor cantidad')
		end
end;

procedure projects();
var
	inputCode, inputCompany, inputPhase, inputType, inputCity, inputQuantity, finishUpload: string;
begin	
	repeat
		writeLn('Ingresa el codigo del proyecto');
		readLn(arrayProjects[countProjects][0]);
		ClrScr;

		writeLn('Selecciona una empresa');
		for i := 0 to countCompanies-1 do
			begin
				writeLn(IntToStr(i+1) + '. ' + arrayCompanies[i,1]);
			end;
		menuOption:= readKey;
		ClrScr;

		for i := 0 to countCompanies-1 do
			begin
				if (menuOption = IntToStr(i+1)) then
					begin
						arrayProjects[countProjects][1] := arrayCompanies[i,0];
						writeLn(IntToStr(i+1)+ '. ' +IntToStr(i+1) + '. ' + arrayCompanies[i,1]);
					end
			end;
		ClrScr;

		writeLn('Ingresa la etapa - preventa (P) obra (O) terminado (T)');
		readLn(arrayProjects[countProjects][2]);
		ClrScr;

		writeLn('Ingresa el tipo - casa (C) edificio departamentado (D) edificio oficina (O) loteos (L)');
		readLn(arrayProjects[countProjects][3]);
		ClrScr;

		writeLn('Selecciona una ciudad');
		for i := 0 to countCities-1 do
			begin
				writeLn(IntToStr(i+1) + '. ' + arrayCities[i,1]);
			end;
		menuOption:= readKey;
		ClrScr;

		for i := 0 to countCities-1 do
			begin
				if (menuOption = IntToStr(i+1)) then
					begin
						arrayProjects[countProjects][4] := arrayCities[i,0];
						writeLn(IntToStr(i+1)+ '. ' +IntToStr(i+1) + '. ' + arrayCities[i,1]);
					end
			end;
		ClrScr;
		writeLn('Ingresa la cantidad');
		readLn(arrayProjects[countProjects][5]);
		ClrScr;

		countProjects := countProjects + 1;

		repeat
			writeLn('¿Quieres seguir cargando proyectos? Ingresa SI o NO');
			readLn(finishUpload);
			ClrScr;
		until (finishUpload = 'SI') or (finishUpload = 'NO');

		for i := 0 to countProjects do
			begin
			for j := 0 to 5 do
				write(arrayProjects[i,j]+' ');
				writeLn;
			end;

	until (finishUpload = 'NO')

end;

procedure products();
var
	response: boolean;
	menuOption: integer;
begin
	writeLn('Programa en desarrollo');
end;

begin
	response:= auth('E');
	if (response = false) then 
		begin
			writeLn('Acceso denegado, servidor bloqueado temporalmente');
			Halt(0);
		end;

	repeat
		writeLn('MENU EMPRESAS');
		writeLn('1. Alta de CIUDADES');
		writeLn('2. Alta de EMPRESAS');
		writeLn('3. Alta de PROYECTOS');
		writeLn('4. Alta de PRODUCTOS');
		writeLn('0. SALIR');
		menuOption:= readKey;
		ClrScr;

		case menuOption of
			'1': cities();
			'2': companies();
			'3': projects();
			'4': products();
		end
	until (menuOption = '0');
end;

procedure client();

procedure clients();
var
	inputName, inputMail, finishUpload: string;

begin
	repeat
		writeLn('Ingresa el nombre y apellido');
		readLn(arrayClients[countClients][0]);
		ClrScr;
		writeLn('Ingresa el mail');
		readLn(arrayClients[countClients][1]);
		ClrScr;

		countClients := countClients + 1;

		repeat
			writeLn('¿Quieres seguir cargando clientes? Ingresa SI o NO');
			readLn(finishUpload);
			ClrScr;
		until (finishUpload = 'SI') or (finishUpload = 'NO');

		for i := 0 to countClients do
			begin
			for j := 0 to 5 do
				write(arrayClients[i,j]+' ');
				writeLn;
			end;

	until (finishUpload = 'NO')
end;

procedure projects();
var
	arrayQueryProjects: array [0..100,0..5] of string;
	countQueryProjects, i, j: integer;

begin
	countQueryProjects := 0;
	// i := 0;

	writeLn('¿Que tipo de proyecto quieres consultar?');
	writeLn('C. Casa');
	writeLn('D. Edificio departamentado');
	writeLn('O. Edificio oficina');
	writeLn('L. Loteos respectivamente');

	menuOption:= readKey;
	ClrScr;



	for i := 0 to countProjects do
		begin
			if arrayProjects[i,3] = menuOption then 
				begin
					arrayQueryProjects[countQueryProjects][0] := arrayProjects[i,0];
					for j := 0 to countCompanies do
						if arrayCompanies[j,0] = arrayProjects[i,1] then 
							begin
								arrayQueryProjects[countQueryProjects,1] := arrayCompanies[i,1];
							end;
					
					case arrayProjects[i,2] of
						'P': arrayQueryProjects[countQueryProjects,2] := 'Preventa';
						'O': arrayQueryProjects[countQueryProjects,2] := 'Obra';
						'T': arrayQueryProjects[countQueryProjects,2] := 'Terminado respectivamente';
					end;

					case arrayProjects[i,3] of
						'C': arrayQueryProjects[countQueryProjects,3] := 'Casa';
						'D': arrayQueryProjects[countQueryProjects,2] := 'Edificio departamentado';
						'O': arrayQueryProjects[countQueryProjects,2] := 'Edificio oficina';
						'L': arrayQueryProjects[countQueryProjects,2] := 'Loteos respectivamente';
					end;

					for j := 0 to countCities do
						if arrayCities[j,0] = arrayProjects[i,4] then 
							begin
								arrayQueryProjects[countQueryProjects,4] := arrayCities[i,1];
							end;

					arrayQueryProjects[countQueryProjects,5] := arrayProjects[i,5];

					countQueryProjects := countQueryProjects + 1;
				end	
		end;

	writeLn('cod_pro | cod_emp | etapa | tipo | cod_ciudad | cantidad');

	for i := 0 to countQueryProjects do
		begin
			for j := 0 to 5 do
				write(arrayQueryProjects[i,j] + ' | ');
				readKey;
		end;
end;

begin
	response:= auth('C');
	if (response = false) then 
		begin
			writeLn('Acceso denegado, servidor bloqueado temporalmente');
			Halt(0);
		end;
		
	repeat
		writeLn('MENU CLIENTES');
		writeLn('1. Alta de CLIENTE');
		writeLn('2. Consulta de proyectos');
		writeLn('0. Volver al menú principal');
		menuOption:= readKey;
		ClrScr;

		case menuOption of
			'1': clients();
			'2': projects();
		end
	until (menuOption = '0');
end;

begin
	countCompanies := 1;
	countCities := 3;
	countClients := 1;
	countProjects := 1;

	arrayClients[0][0] := 'Name';
	arrayClients[0][1] := 'Mail';
	arrayCities[0][0] := 'BAS';
	arrayCities[0][1] := 'Buenos Aires';
	arrayCities[1][0] := 'CBA';
	arrayCities[1][1] := 'Cordoba';
	arrayCities[2][0] := 'ROS';
	arrayCities[2][1] := 'Rosario';
	arrayCompanies[0][0] := 'Co1';
	arrayCompanies[0][1] := 'Empresa 1';
	arrayCompanies[0][2] := 'Zeballos 1341';
	arrayCompanies[0][3] := 'empresa@ejemplo.com';
	arrayCompanies[0][4] := '4583818';
	arrayCompanies[0][5] := 'BAS';
	arrayProjects[0][0] := 'Pr1';
	arrayProjects[0][1] := 'Co1';
	arrayProjects[0][2] := 'P';
	arrayProjects[0][3] := 'C';
	arrayProjects[0][4] := 'CBA';
	arrayProjects[0][5] := '2';

	repeat
		writeLn('MENU PRINCIPAL');
		writeLn('1. EMPRESAS');
		writeLn('2. CLIENTES');
		writeLn('0. SALIR');
		menuOption:= readKey;
		ClrScr;

		case menuOption of
			'1': company();
			'2': client();
		end
	until (menuOption = '0');
end.