unit uInterface;

interface

type
  IFileRead = interface
    ['{0C1716F3-ABD8-4145-A869-9842ACEFE703}']
    procedure ReadToFile;
  end;

  IFileWrite = interface
    ['{0F549E12-7F75-4214-957C-8C048CDF6B29}']
    procedure SaveToFile;
  end;

implementation

end.
