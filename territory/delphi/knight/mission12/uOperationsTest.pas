unit uOperationsTest;

interface
uses
  DUnitX.TestFramework,
  uOperations;

type

  [TestFixture]
  TOperationsTest = class(TObject)
  private
    FOperations: TOperations;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('SortLetters','woodcutter,cdeoorttuw')]
    [TestCase('SortLetters','Nice,ceiN')]
    procedure TestSortLetters(Const pWord, pExpected: string);

    [Test]
    [TestCase('CountOccurrencesOk','Everybody,e,2')]
    [TestCase('CountOccurrencesOk2','Everybody,Y,2')]
    procedure TestCountOccurrences(Const pWord, pLetter: string; const pExpected: integer);

    [Test]
    [TestCase('CountOccurrencesWordEmpty',',e')]
    procedure TestCountOccurrencesWordEmpty(Const pWord, pLetter: string);

    [Test]
    [TestCase('CountOccurrencesLetterEmpty','Everybody,')]
    procedure TestCountOccurrencesLetterEmpty(Const pWord, pLetter: string);

    [Test]
    [TestCase('CountOccurrencesLetterEmpty','João,Joao')]
    [TestCase('CountOccurrencesLetterEmpty','André,Andre')]
    procedure TestRemoveAccents(Const pWord, pExpected: string);

    [Test]
    [TestCase('CountOccurrencesLetterEmpty','Jo@o')]
    procedure TestRemoveAccentsNoAlphaNumeric(Const pWord: string);
  end;

implementation

procedure TOperationsTest.Setup;
begin
  FOperations := TOperations.Create;
end;

procedure TOperationsTest.TearDown;
begin
  FOperations.Free;
end;

procedure TOperationsTest.TestCountOccurrences(const pWord, pLetter: string;
  const pExpected: integer);
var
  vResult: integer;
begin
  vResult := FOperations.CountOccurrences(pWord, pLetter);
  Assert.AreEqual(pExpected,vResult);
end;

procedure TOperationsTest.TestCountOccurrencesLetterEmpty(const pWord,
  pLetter: string);
begin
  Assert.WillRaise(
    procedure
    begin
      FOperations.CountOccurrences(pWord, pLetter);
    end,
    ELetterIsEmpty
  );
end;

procedure TOperationsTest.TestCountOccurrencesWordEmpty(const pWord,
  pLetter: string);
begin
  Assert.WillRaise(
    procedure
    begin
      FOperations.CountOccurrences(pWord, pLetter);
    end,
    EWordIsEmpty
  );
end;

procedure TOperationsTest.TestRemoveAccents(const pWord, pExpected: string);
var
  vResult: string;
begin
  vResult := FOperations.RemoveAccents(pWord);
  Assert.AreEqual(pExpected,vResult);
end;

procedure TOperationsTest.TestRemoveAccentsNoAlphaNumeric(const pWord: string);
begin
  Assert.WillRaise(
    procedure
    begin
      FOperations.RemoveAccents(pWord);
    end,
    ENoAlphaNumeric
  );
end;

procedure TOperationsTest.TestSortLetters(const pWord, pExpected: string);
var
  vResult: string;
begin
  vResult := FOperations.SortLetters(pWord);

  Assert.AreEqual(pExpected,vResult);
end;

initialization
  TDUnitX.RegisterTestFixture(TOperationsTest);

end.
