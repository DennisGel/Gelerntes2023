PROGRAM Rezeptfarbe3;

##Juli 2023

USES crt;

VAR antwort: Char;
FUNCTION frage(text:String):Char;
    VAR antwort:char;
BEGIN    
    REPEAT
    WRITELN(text);
    READLN(antwort);
    UNTIL (antwort= 'j')or(antwort= 'n');
        frage:=antwort;
END;
BEGIN
    
    antwort:=frage('Ist es ein Betäubungsmittel (j/n)?: ');
    
    IF lowercase(antwort) = 'j' THEN BEGIN
        WRITELN('Rezeptfarbe: gelb');
    END
    ELSE BEGIN
        
        antwort:=frage('Sind Sie privat versichert (j/n)?: ');


        IF lowercase(antwort) = 'j' THEN BEGIN
            WRITELN('Rezeptfarbe: blau');
        END
        ELSE BEGIN

            antwort:=frage('Ist es verschreibungspflichtig (j/n)?: ');


            IF lowercase(antwort) = 'j' THEN BEGIN
                WRITELN('Rezeptfarbe: rosa');
            END
            ELSE BEGIN
                WRITELN('Rezeptfarbe: grün');
            END;

        END;

    END;

END.
