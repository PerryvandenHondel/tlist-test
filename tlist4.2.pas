program TList4;


{$MODE OBJFPC}


uses
    Classes,
    generics.collections,
    SysUtils;    


var
    list: TList<Ansistring>;


begin
    { Create the list}
    list := TList<Ansistring>.Create;
    
    List.Add('sc_testclass4');


    { Free the memory used by the list }
    list.Free;
end. { of program TList4 }