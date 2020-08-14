/////////////////////////////////////////////////////////////////////
//  Author: Messias Bueno                                          //
//    Date: 13/08/2020                                             //
// Mission: Faça o download e instalação do framework Horse        //
//          (https://github.com/HashLoad/horse) para criar uma API //
//          no Delphi. Essa API deverá exportar duas rotas:        //
//            /estados: retorna uma lista com o nome de todos os   //
//                      estados do Brasil;                         //
//            /estado/{id}: retorna o nome, sigla, região e        //
//                          capital do estado referente ao ID      //
//                          informado. Use a página do Wikipedia   //
//                          para definir os IDs:                   //
//    https://pt.wikipedia.org/wiki/Unidades_federativas_do_Brasil //
/////////////////////////////////////////////////////////////////////
program mission09;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse.Commons in 'ThirdParty\Horse\Horse.Commons.pas',
  Horse.Constants in 'ThirdParty\Horse\Horse.Constants.pas',
  Horse.Core.Group.Contract in 'ThirdParty\Horse\Horse.Core.Group.Contract.pas',
  Horse.Core.Group in 'ThirdParty\Horse\Horse.Core.Group.pas',
  Horse.Core in 'ThirdParty\Horse\Horse.Core.pas',
  Horse.Core.Route.Contract in 'ThirdParty\Horse\Horse.Core.Route.Contract.pas',
  Horse.Core.Route in 'ThirdParty\Horse\Horse.Core.Route.pas',
  Horse.Core.RouterTree in 'ThirdParty\Horse\Horse.Core.RouterTree.pas',
  Horse.Exception in 'ThirdParty\Horse\Horse.Exception.pas',
  Horse.HTTP in 'ThirdParty\Horse\Horse.HTTP.pas',
  Horse in 'ThirdParty\Horse\Horse.pas',
  Horse.Proc in 'ThirdParty\Horse\Horse.Proc.pas',
  Horse.Provider.Abstract in 'ThirdParty\Horse\Horse.Provider.Abstract.pas',
  Horse.Provider.Apache in 'ThirdParty\Horse\Horse.Provider.Apache.pas',
  Horse.Provider.CGI in 'ThirdParty\Horse\Horse.Provider.CGI.pas',
  Horse.Provider.Console in 'ThirdParty\Horse\Horse.Provider.Console.pas',
  Horse.Provider.Daemon in 'ThirdParty\Horse\Horse.Provider.Daemon.pas',
  Horse.Provider.FPCApacheApplication in 'ThirdParty\Horse\Horse.Provider.FPCApacheApplication.pas',
  Horse.Provider.FPCCGIApplication in 'ThirdParty\Horse\Horse.Provider.FPCCGIApplication.pas',
  Horse.Provider.FPCFCGIApplication in 'ThirdParty\Horse\Horse.Provider.FPCFCGIApplication.pas',
  Horse.Provider.FPCHTTPApplication in 'ThirdParty\Horse\Horse.Provider.FPCHTTPApplication.pas',
  Horse.Provider.ISAPP in 'ThirdParty\Horse\Horse.Provider.ISAPP.pas',
  Horse.WebModule in 'ThirdParty\Horse\Horse.WebModule.pas' {HorseWebModule: TWebModule},
  ThirdParty.Posix.Syslog in 'ThirdParty\Horse\ThirdParty.Posix.Syslog.pas',
  Web.WebConst in 'ThirdParty\Horse\Web.WebConst.pas',
  uState in 'uState.pas',
  uStateList in 'uStateList.pas',
  Horse.Jhonson in 'ThirdParty\jhonson\Horse.Jhonson.pas';

begin
  THorse.Use(Jhonson);
  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln(Format('Server is runing on %s:%d', [Horse.Host, Horse.Port]));
    end
  );
end.
