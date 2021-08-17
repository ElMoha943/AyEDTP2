program prueba2020;
uses crt,SysUtils;

var
    Nombres: array [1..50] of string; //Nombres de la raza.
    Raza: array [1..50, 1..15] of Integer; // Raza y que vacunas tiene.
    Vacunas: array [1..15,1..2] of Integer; // stock y precio de vacunas.
    i, v, r, recaudado, indicer, indicev, opt, num: integer;
    // yy,mm,dd : Word;

function fecha(): string;
begin
    fecha := 'Owo';
end;

procedure cargar(cosa: Char);
    begin
        if cosa = 'R' then
            begin
                repeat
                    if (indiceR < 50) then
                        begin
                            writeln('Ingrese el nobmre de la raza');
                            readln(Nombres[indiceR]);
                            for i := 1 to indicev-1 do
                                repeat
                                    writeln('Vacuna ',i,'Ponga 1 para aplicable o 0 para no aplicable');
                                    readln(Raza[indiceR][i]);
                                until ((Raza[indiceR][i] = 1) or (Raza[indiceR][i] = 0));
                        end
                    else
                        writeln('No se pueden ingresar mas razas');
                    indiceR := indiceR + 1;
                    writeln('Ingrese 0 para salir u otra cosa para ingresar otro');
                    readln(num);
                until (num = 0);
            end
        else
            begin
                if indicev < 15 then
                    begin
                        writeln('Ingrese el stock de la vacuna ',indicev);
                        readln(Vacunas[indiceV][1]);
                        writeln('Ingrese el precio de la vacuna ',indicev);
                        readln(Vacunas[indiceV][2]);
                        indiceV := indiceV+1;
                    end
                else
                    writeln('No se puede ingresar mas vacunas');
            end;           
    end;

procedure stock();
    begin
        for i := 1 to indicev-1 do
            writeln('Stock vacuna ',i,': ',vacunas[i][1]); 
    end;

procedure vacunar();
    begin
        writeln('Ingrese la raza del animal');
        readln(r);
        writeln('Ingrese la vacuna a colocar');
        readln(v);
        if Raza[r][v] = 1 then
            begin
                writeln('Monto a pagar: ',vacunas[v][2],'ingrese 1 para aceptar el pago');
                readln(num);
                if num = 1 then
                    begin
                        vacunas[v][1] := vacunas[v][1] -1;
                    // DeCodeDate (Date,yy,mm,dd);
                    // writeln('REMITO >> Raza: ',r,' Vacuna: ',v,' Fecha: ',dd,'/',mm,'/',yy);
                    writeln('REMITO >> Raza: ',r,' Vacuna: ',v,' Fecha: ',fecha());
                    recaudado := recaudado + vacunas[v][2];
                    end;
            end
        else
            writeln('esa vacuna no es para esa raza');
    end;

Begin
    indiceR := 1;
    indiceV := 1;
    recaudado := 0;
    repeat
        writeln('MENU');
        readln(opt);
        case opt of
            1: cargar('R');
            2: cargar('V');
            3: stock();
            4: vacunar();
        end;
    until opt = 5;
    writeln('Recaudacion del dia: ',recaudado);
End.
