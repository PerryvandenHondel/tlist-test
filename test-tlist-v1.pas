program TestTList;
{
    Source: https://forum.lazarus.freepascal.org/index.php?topic=22905.0
}



{$MODE OBJFPC}



uses
    Classes;



type
  TTest = class
    Value: integer;
  end;


	ptrServerClass = ^recServerClass;
  	recServerClass = record
		strServerClass: Ansistring;
		strListType: Ansistring;
		strHostName: Ansistring;
	end; { of recServerClass }



var
	newRecord = recServerClass;

  aList: TList;
  aTest: TTest;
  i: integer;


procedure ListCreate();
begin
  aList:=TList.Create;
end;


procedure ListFillWithTestData();
begin
  for i:=0 to 9 do
    begin
        aTest:=TTest.Create;
        aTest.Value := Random(10);
        aList.Add(aTest);
    end;
end;


procedure ListShow();
begin
  for i:=0 to aList.Count-1 do
    writeln(i, ': ', TTest(aList[i]).Value);
end;


procedure ListFree();
begin
  //take care about self created items
  for i:=aList.Count-1 downto 0 do
    TTest(aList[i]).Free;
    
  aList.Clear;
  aList.Free;
end;


begin
  Randomize;

  ListCreate();

  ListFillWithTestData();

  ListShow();

  ListFree();  
end.