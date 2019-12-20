program TestTList;



{$MODE OBJFPC}



uses
    Classes;



type
	ptrServerClass = ^recServerClass;
  	recServerClass = record
		strServerClass: Ansistring;
		strListType: Ansistring;
		strHostName: Ansistring;
	end; { of recServerClass }



var
	newRecord: ptrServerClass;
    myList: TList;



procedure ListShowAll();
var
	b: Integer;
begin
	if (myList.Count <> 0) then
  	begin
    	for b := (myList.Count - 1) downto 0 do
    	begin
      		newRecord := myList.Items[b];
      		WriteLn(b, ': ', newRecord^.strServerClass, #9, newRecord^.strListType, #9, newRecord^.strHostName);
    	end;
		WriteLn('There are ', myList.Count, ' entries in the list.');
  	end
	else
		WriteLn('List is empty!');
end;

procedure ListDelete(newServerClass: Ansistring; newListType: Ansistring; newHostName: Ansistring);
var
	deleteRecord: ptrServerClass;
begin
	New(deleteRecord);

	deleteRecord^.strServerClass := newServerClass;
    deleteRecord^.strListType := newListType;
    deleteRecord^.strHostName := newHostName;

	WriteLn('ListDelete(): ', myList.IndexOf(deleteRecord));

end; { of procedure ListDelete() }



procedure ListAdd(newServerClass: Ansistring; newListType: Ansistring; newHostName: Ansistring);
var
	i: Integer;
begin
	New(newRecord);
    newRecord^.strServerClass := newServerClass;
    newRecord^.strListType := newListType;
    newRecord^.strHostName := newHostName;

	i := myList.IndexOf(newRecord);
	WriteLn('ListAdd(): ', i);
    if (i = -1) then 
		myList.Add(newRecord);
end;


begin
	myList := TList.Create;

	ListAdd('sc_newserverclass', 'whitelist', 'servername1*');
	ListAdd('sc_newserverclass', 'whitelist', 'servername2*');
	ListAdd('sc_newserverclass', 'whitelist', 'servername3*');
	ListAdd('sc_newserverclass', 'whitelist', 'servername3*');
	ListAdd('sc_firstclass', 'whitelist', 'hostje78*');
	ListAdd('sc_secondclass', 'blacklist', 'server1332*');
	ListAdd('sc_anotherclass', 'whitelist', 'srv7464*');
	ListShowAll();

	ListDelete('sc_secondclass', 'blacklist', 'server1332*');

	Dispose(newRecord);
	myList.Free;
end.