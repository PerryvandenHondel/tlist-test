program TList5;


{$MODE DELPHI}


uses
    SysUtils, Generics.Collections, Generics.Defaults;



type
    TServerClass = class
        public
            sortName: Ansistring;
            serverClass: Ansistring;
            listType: Ansistring;
            hostName: Ansistring;
    
        constructor Create(const sortName: Ansistring; const serverClass: Ansistring; listType: Ansistring; hostName: Ansistring);
    end; { of class TServerClass }



var
    serverClassList: TObjectList<TServerClass>;
    serverClass: TServerClass;
    indexFound: Integer;



constructor TServerClass.Create(const sortName: Ansistring; const serverClass: Ansistring; listType: Ansistring; hostName: Ansistring);
begin
    Self.sortName := sortName;
    Self.serverClass := serverClass;
    Self.listType := listType;
    Self.hostName := hostName;
end; { of constructor TServerClass.Create() }



function CompareBySortName(constref Item1, Item2: TServerClass): Integer;
{
    TList sort routine : Compare entries by SortNamee

    The returned integer has the following value :

        > 0 : (positive) serverClass1 is less than serverClass2
          0 : serverClass1 is equal to serverClass2
        < 0 : (negative) IteserverClass1 is greater than serverClass12
}
var
    serverClass1: TServerClass;
    serverClass2: TServerClass;
begin
    // We start by viewing the object pointers as TCustomer objects
    serverClass1 := TServerClass(Item1);
    serverClass2 := TServerClass(Item2);

    // Now compare by string
    if serverClass1.sortName > serverClass2.sortName then
        Result := 1
    else if serverClass1.sortName = serverClass2.sortName then 
        Result := 0
    else 
        Result := -1;
end; { of function CompareBySortName() }



procedure ShowListEntries(title: Ansistring);
var
    i: Integer;
    c: Integer;
begin
    Writeln;
    Writeln('========================');
    Writeln(title);
    Writeln('========================');

    c := serverClassList.Count;
    for i := 0 to c - 1 do
    begin
        Writeln(i, ': ', TServerClass(serverClassList[i]).sortName, #9, 
            TServerClass(serverClassList[i]).serverClass, #9,
            TServerClass(serverClassList[i]).listType, #9, 
            TServerClass(serverClassList[i]).hostName);
    end; { of for }
    Writeln('========================');
    Writeln('Number of entries: ', c);
    Writeln('========================');
    Writeln;
end; { of procedure ShowListEntries() }


begin
    Writeln('Running tlist5, test of TList');

    serverClassList := TObjectList<TServerClass>.Create;

    { 1 Adding items to the list}
    serverClassList.Add(TServerClass.Create('sc_serverclass5|whitelist|host7655', 'sc_serverclass5', 'whitelist', 'host7655'));
    serverClassList.Add(TServerClass.Create('sc_servertest43|whitelist|hostserver6', 'sc_servertest43', 'whitelist', 'hostserver6'));
    serverClassList.Add(TServerClass.Create('sc_servertest43|whitelist|hostserver3', 'sc_servertest43', 'whitelist', 'hostserver3'));
    serverClassList.Add(TServerClass.Create('sc_servertest43|whitelist|hostserver4', 'sc_servertest43', 'whitelist', 'hostserver4'));
    serverClassList.Add(TServerClass.Create('sc_servertest43|whitelist|hostserver5', 'sc_servertest43', 'whitelist', 'hostserver5'));
    serverClassList.Add(TServerClass.Create('sc_zzwhatever|whitelist|zzhost32', 'sc_zzwhatever', 'whitelist', 'zzhost32'));
    serverClassList.Add(TServerClass.Create('sc_zzwhatever|blacklist|zzhost1', 'sc_zzwhatever', 'blacklist', 'zzhost1'));

    serverClass := TServerClass.Create('dummyclass|blacklist|dummyhost', 'dummyclass', 'blacklist', 'dummyhost');
    serverClassList.Add(serverClass);

    serverClassList.Add(TServerClass.Create('sc_numbytest|whitelist|host5655', 'sc_numbytest', 'whitelist', 'host5655'));
    serverClassList.Add(TServerClass.Create('sc_bhdydrt|whitelist|server23' ,'sc_bhdydrt', 'whitelist', 'server23'));
    serverClassList.Add(TServerClass.Create('whateverclass|whitelist|name65', 'whateverclass', 'whitelist', 'name65'));

    if serverClassList.Contains(serverClass) then
        Writeln('Dummyclass is in the list!');

    indexFound := serverClassList.IndexOf(serverClass);
    Writeln('Found at ', indexFound);

    ShowListEntries('Full list');

    Writeln('Removed entry ', indexFound);
    serverClassList.Delete(indexFound);

    ShowListEntries('Updated list');

    WriteLn('Sort the list');
    //PlayersList.Sort(TComparer<TPlayer>.Construct(ComparePlayersByGoalsDecs));
    serverClassList.Sort(TComparer<TServerClass>.Construct(CompareBySortName));

    ShowListEntries('Sorted list');


    { Destroy the list and all members }
    FreeAndNil(serverClassList);

end. { of program TList5 s}

