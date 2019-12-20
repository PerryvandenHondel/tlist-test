program TList3;



{$MODE OBJFPC}



uses
    Classes;    




type
    TServerClass = class
        private
            serverClass: Ansistring;
            listType: Ansistring;
            hostName: Ansistring;

        public

        constructor Create(const newServerClass: Ansistring;
                         const newListType: Ansistring;
                         const newHostName: Ansistring);
    
    end; { of class TServerClass }



var 
    myList: TList;
    serverList: TServerClass;



constructor TServerClass.Create(const newServerClass: Ansistring;
                         const newListType: Ansistring;
                         const newHostName: Ansistring);
begin
  // Save the passed parameters
  self.serverClass := newServerClass;
  self.listType := newListType;
  self.hostName := newHostName;
end; { of constructor TServerClass.Create() }



procedure ShowList();
{
    Show the contents of the myList
}
var
    i: Integer;
    c: Integer;
begin
    c := myList.Count - 1;
    WriteLn;
    WriteLn('== List has ', c, ' records ==');
    for i := 0 to c do
    begin
        WriteLn(i, ': ', TServerClass(myList[i]).serverClass, #9, TServerClass(myList[i]).listType, #9, TServerClass(myList[i]).hostName);
    end;  { of for }
end; { of procedure ShowList() }


begin
    WriteLn('Running tlist3.');
    
    { Create a list }
    myList := TList.Create;

    serverList := TServerClass.Create('sc_serverclasstest', 'whitelist', 'hostname1');
    myList.Add(serverList);

    myList.Add(TServerClass.Create('sc_serverclass2', 'whitelist', 'hostname434'));
    myList.Add(TServerClass.Create('sc_serverclass4', 'blacklist', 'hostje2345'));
    myList.Add(TServerClass.Create('sc_zzanderslaat', 'whitelist', 'hostje12'));
    myList.Add(TServerClass.Create('sc_aafirstinlist', 'blacklist', 'hosdhd655'));

    ShowList();

    myList.Delete(2);

    ShowList();

    

    //WriteLn(myList.IndexOf(TServerClass.Create('sc_zzanderslaat', 'whitelist', 'hostje12')));

    { Free up the list}
    myList.free;
end.