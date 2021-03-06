//+---------------------------------------------------------------------+
//|                                                NewWayTrading.mq5    |
//|                              Copyright 2021, Gustavo de Souza Lima  |
//|                                               https://www.mql5.com  |
//+---------------------------------------------------------------------+
#property copyright "Copyright 2021, Gustavo de Souza Lima"
#property link      "https://www.mql5.com/pt/signals/863156"
#define VERSION "1.4.6"
#property version VERSION
#property description "      "
#property description "Um Indicador para auxiliar quem opera sem Stop Loss.  - "
#property description "E-mail - gudesouzalima@gmail.com"
#property description "Meu MQL - https://www.mql5.com/pt/signals/863156"
#property indicator_chart_window
#include <Arrays\ArrayString.mqh>

string IndicatorName="NewWayTrading";
#include "PainelConfiguracao.mqh"
#include "Estilos.mqh"
#include "MA_cross.mqh"
#include "DisplayPaineis.mqh"
#include "PieChart.mqh"

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+

int OnInit()
  {
      // simbolo do ativo no final
      SimboloFinalAtivo = StringFind(AccountInfoString(ACCOUNT_COMPANY), "W7 Limited") >=0 ? ".a" : LetrasFinalPares;
      
      RemoveOutrosDisplays("tudo");
      //--- indicator buffers mapping
      ChartSetInteger(0,CHART_FOREGROUND,false);
      //---
      
      TimeCurrent(Tempo);
            
      // calcula Topo e Fundo Historicos
      CalculaTopoFundo(MesesHistoricos);

      // carrega variaveis dinamicas
      PegaVariaveisDinamicas();
      // chama Orientacao de Compra ou Venda ou Neutra
      ChamaOrientacao();
           
      // Cria as linhas de topo, mediana, fundo e preco medio
      CriaLinhasHistoricas();
      // carrega parte visual do Display do arquivo Estilos
      MostrarApenasLotes ==true ? EsconderOuMostraDisplay() : CriaDisplay();
      
      // Verifica se a moeda operada for JPY
      OrientacaoJPY = StringFind(Symbol(), "JPY") >= 0 ? 100 : 1;

      // TimeFrame Padrão do Painel Pares
      if(PadraoTimePares == 1) paresTimeFrame = "DIA";
      else if(PadraoTimePares == 2) paresTimeFrame = "SEMANA";
      else if(PadraoTimePares == 3) paresTimeFrame = "MÊS";
      // TimeFrame Padrão da Força
      if(PadraoTimeForca == 1) forcaTimeFrame = "M1";
      else if(PadraoTimeForca == 2) forcaTimeFrame = "M5";
      else if(PadraoTimeForca == 3) forcaTimeFrame = "M15";
      else if(PadraoTimeForca == 4) forcaTimeFrame = "M30";
      else if(PadraoTimeForca == 5) forcaTimeFrame = "H1";
      else if(PadraoTimeForca == 6) forcaTimeFrame = "H4";
      else if(PadraoTimeForca == 7) forcaTimeFrame = "D1";
      else if(PadraoTimeForca == 8) forcaTimeFrame = "W1";
      else if(PadraoTimeForca == 9) forcaTimeFrame = "MN1";      

      // Verifica se Painel de Pares tem que ser exibido
      if(EnablePainelPares) EsconderOuMostraDisplayPares();
      // Verifica se Painel de Moedas tem que ser exibido
      if(EnablePainelForca) EsconderOuMostraDisplayForca();      
      // Verifica se Painel de Moedas tem que ser exibido
      if(EnablePainelCustom) EsconderOuMostraDisplayCustom(); 

      IndicatorSetString(INDICATOR_SHORTNAME,IndicatorName);
   
      ChartRedraw();
                       
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---

//+------------------------------------------------------------------+
//| Mostra se o par esta aberto no momento                 |
//+------------------------------------------------------------------+    

   string ParOperado;
   PosicoesAbertasNoPar = 0;
   LotesUsadosNoPar = 0.0;
   
   for(int i=PositionsTotal()-1; i>=0; i--)
      {
         ParOperado = PositionGetSymbol(i);
         PositionProfit = PositionGetDouble(POSITION_PROFIT);
         
         if(AlertaLucroEscolha !=0)
           {
            ChamaAlertaLucro(ParOperado);
           }                          

         if(ChartSymbol(0)==ParOperado)
         {
            PosicoesAbertasNoPar += 1; // Quantidade do par operado no momento
            LotesUsadosNoPar += PositionGetDouble(POSITION_VOLUME); // lotes operados no momento no par   
         }              
       }

//+------------------------------------------------------------------+
//| Chama Novamente Funcoes                 |
//+------------------------------------------------------------------+
         
      PegaVariaveisDinamicas(); // pega dinamicamente
      DistanciaMediana = (PrecoBid - Mediana)*100000/OrientacaoJPY;

//+------------------------------------------------------------------+
//| Mostra a Media de Pontos Movimentados pelo Par no Dia            |
//+------------------------------------------------------------------+
   MovimentacaoParHoje = PontosHoje*100000/OrientacaoJPY;
   // Media de Pontos que a Moeda Faz por Dia
   double MovDiario = CalculaMediaMovDiaria(DiasMovMedia);
   MediaMovDiario = MovDiario*100000/OrientacaoJPY;
   
   PorcMovNoMomento = MediaMovDiario!=0 ? (MovimentacaoParHoje/MediaMovDiario)*100 : 0.0;
  
   // chama a orientacao baseado nos dados acima
   ChamaOrientacao();    

   // Mostra a Diversificação de Pares Diferentes Operados
   DiversificacaoPares = CalculaQtdDiversificacaoPares();
   
   // Funcao que chama variaveis constantemente alimentadas
   EscreveInformacoesDinamicas(
   PosicoesAbertasNoPar,
   DiversificacaoPares,
   LotesUsadosNoPar,
   TextoMediana,
   DistanciaMediana,
   MediaMovDiario,
   MovimentacaoParHoje,
   PorcMovNoMomento,
   SwapCompra,
   SwapVenda,
   SpreadAtual,
   OrientacaoFundoOuTopo,
   Orientacao,
   CorQuadroOrientacao
   );
   
   // se o Painel estiver acionado atualiza os valores
   if(EsconderDisplayPares==true)
      {
         if(TimeCurrent() >= TimerAguardar)
         {
            InsereDadosPares();
            ChartRedraw();
            TimerAguardar = TimeCurrent() + 10; // chama a funcao em segundos
         }   
      }      
  
   if(EsconderDisplayParesCustom==true)
      {
         if(TimeCurrent() >= TimerAguardar3)
         {
            CriarDisplayCustom();
            ChartRedraw();
            TimerAguardar3 = TimeCurrent() + 10; // chama a funcao em segundos
         }
      }   

   if(EsconderDisplayParesPrecos==true)
      {
         if(TimeCurrent() >= TimerAguardar3)
         {
            InsereParesPrecos();
            ChartRedraw();
            TimerAguardar3 = TimeCurrent() + 10; // chama a funcao em segundos
         }
      }
      
   if(EsconderDisplayForcaMoeda==true)
      {
         if(TimeCurrent() >= TimerAguardar2)
         {
            SomaQuantidadeMoedaBase();
            ChartRedraw();
            TimerAguardar2 = TimeCurrent() + 10; // chama a funcao em segundos
         }
      }

   // se o Painel estiver acionado atualiza os valores
   if(EsconderDisplayDadosEconomicos==true)
      {
         if(TimeCurrent() >= TimerAguardar3)
         {
            InsereDadosEconomicos();
            ChartRedraw();
            TimerAguardar3 = TimeCurrent() + 10; // chama a funcao em segundos
         }
      }

   // se o Painel estiver acionado atualiza os valores
   if(EsconderDisplayOperacoesAbertas==true)
      {
         if(TimeCurrent() >= TimerAguardar3)
         {
            //RemoveOutrosDisplays("operacoesAbertas");
            //EsconderDisplayOperacoesAbertas = true;
            TodasOperacoesAbertas();
            ChartRedraw();
            TimerAguardar3 = TimeCurrent() + 5; // chama a funcao em segundos
         }
      }

//+------------------------------------------------------------------+  
// Fim Oncalculate  
//+------------------------------------------------------------------+
   return(rates_total);
  }  



void OnDeinit(const int reason)
  {
//---
   //deleta os objetos se nao for troca de timeframe
   //Print(UninitializeReason());
   if(UninitializeReason()==1 || UninitializeReason()==2) ObjectsDeleteAll(0,0);
   if(UninitializeReason()==3) RemoveOutrosDisplays("tudo");
   //if(HabilitarLinhasMoveis) CleanChart();
   ChartRedraw();
  }


void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
  { 
   // calcula Topo e Fundo Historicos
   CalculaTopoFundo(MesesHistoricos);
   // evento de click no botao
   if(id==CHARTEVENT_OBJECT_CLICK)
     {
      // esconder o display
      if(sparam=="EsconderDisplayBtn")
        {
         EsconderOuMostraDisplay();
        }   

      if(sparam=="MenuSecundarioBtn")
        {
         EsconderOuMostraMenuSecundario();
        }
        
      if(EsconderMenuSecundario == true)
        {    
         if(sparam=="DisplayParesBtn")
           {
            EsconderOuMostraDisplayPares();
           }
           
         if(sparam=="DisplayParesCustomBtn")
           {
            EsconderOuMostraDisplayCustom();
           }
           
         if(sparam=="DisplayParesPrecosBtn")
           {
            EsconderOuMostraDisplayPrecos();
           }
                   
         if(sparam=="DisplayForcaMoedaBtn")
           {
            EsconderOuMostraDisplayForca();
           }
   
         if(sparam=="ExposicaoMoedasBtn")
           {
            EsconderOuMostraDisplayExposicao();
           }
   
         if(sparam=="DisplayDadosEconomicosBtn")
           {
            EsconderOuMostraDisplayDadosEconomicos();
           }
   
         if(sparam=="OperacoesAbertasBtn")
           {
            EsconderOuMostraDisplayOperacoesAbertas();
           }
        }

      if(EsconderDisplayPares == true)
        {
            for (int i = 0; i < 3; i++)
            {
               if(sparam == "labelParesTimeFrame_"+IntegerToString(i))
               {
                  paresTimeFrame = ObjectGetString(0, sparam, OBJPROP_TEXT);  
                  CriarDisplayPares();
               }
            }
            //evento que identifica se foi clicado nos Ativos do Display para abrir no mesmo grafico
            for (int i = 1; i < ObjectsTotal(0, 0, OBJ_EDIT); i++)
            {
               // painel pares
               string objectNameParesC1 = "label1_c0_l"+IntegerToString(i);
               string objectNameParesC2 = "label2_c0_l"+IntegerToString(i);
                        
               if(objectNameParesC1 == sparam || objectNameParesC2 == sparam)
               {
                  string objectPar = ObjectGetString(0, sparam, OBJPROP_TEXT);
                  ChartSetSymbolPeriod(0, objectPar+SimboloFinalAtivo, _Period); //Abre na mesma janela
               }
            }
        }

      if(EsconderDisplayParesCustom == true)
        {
            for (int i = 0; i < 3; i++)
            {
               if(sparam == "labelParesCustomTimeFrame_"+IntegerToString(i))
               {
                  paresTimeFrame = ObjectGetString(0, sparam, OBJPROP_TEXT);  
                  CriarDisplayCustom();
               }
            }
            //evento que identifica se foi clicado nos Ativos do Display para abrir no mesmo grafico
            for (int i = 1; i < ObjectsTotal(0, 0, OBJ_EDIT); i++)
            {
               // painel pares
               string objectNameParesC1 = "labelParesCustom1_c0_l"+IntegerToString(i);
               string objectNameParesC2 = "labelParesCustom2_c0_l"+IntegerToString(i);
               string objectNameParesC3 = "labelParesCustom3_c0_l"+IntegerToString(i);
                        
               if(objectNameParesC1 == sparam || objectNameParesC2 == sparam || objectNameParesC3 == sparam)
               {
                  string objectPar = ObjectGetString(0, sparam, OBJPROP_TEXT);
                  ChartSetSymbolPeriod(0, objectPar+SimboloFinalAtivo, _Period); //Abre na mesma janela
               }
            }
        }
      
      if(EsconderDisplayForcaMoeda == true)
        {
         for (int i = 0; i < 9; i++)
         {
            if(sparam == "labelForcaTimeFrame_c0_l"+IntegerToString(i))
            {
               forcaTimeFrame = ObjectGetString(0, sparam, OBJPROP_TEXT);  
               CriarDisplayForcaMoeda();
            }
         }
         //evento que identifica se foi clicado nos Ativos do Display para abrir no mesmo grafico
         for (int i = 1; i < ObjectsTotal(0, 0, OBJ_EDIT); i++)
         {
            // painel precos
            string objectNamePrecosC1 = "labelPrecos1_c0_l"+IntegerToString(i);
            string objectNamePrecosC2 = "labelPrecos2_c0_l"+IntegerToString(i);
            string objectNamePrecosC3 = "labelPrecos3_c0_l"+IntegerToString(i);
                     
            if(objectNamePrecosC1 == sparam || objectNamePrecosC2 == sparam || objectNamePrecosC3 == sparam)
            {
               string objectPar = ObjectGetString(0, sparam, OBJPROP_TEXT);
               ChartSetSymbolPeriod(0, objectPar+SimboloFinalAtivo, _Period); //Abre na mesma janela
            }
         }
        }

      if(EsconderDisplayOperacoesAbertas==true)
        {
            //evento que identifica se foi clicado nos Ativos do Display para abrir no mesmo grafico
            for (int i = 1; i < ObjectsTotal(0, 0, OBJ_EDIT); i++)
            {
               // painel pares
               string objectNameOperacoes1 = "labelOperacoes1_c0_l"+IntegerToString(i);
               string objectNameOperacoes2 = "labelOperacoes2_c0_l"+IntegerToString(i);
                        
               if(objectNameOperacoes1 == sparam || objectNameOperacoes2 == sparam)
               {
                  string objectPar = ObjectGetString(0, sparam, OBJPROP_TEXT);
                  ChartSetSymbolPeriod(0, objectPar+SimboloFinalAtivo, _Period); //Abre na mesma janela
               }
            }
        }

      if(EsconderDisplayDadosEconomicos == true)
        {
         for (int i = 0; i < 11; i++)
         {
            if(sparam == "labelDadosEconomicosMoeda_c0_l"+IntegerToString(i))
            {
               MoedaBasePais = ObjectGetString(0, sparam, OBJPROP_TEXT);  
               CriarDadosEconomicos();
            }
            
            if(i>0)
            {
               if(sparam == "labelDadosEconomicos_c1_l"+IntegerToString(i))
               {
                  string objectPar = ObjectGetString(0, sparam, OBJPROP_TEXT);
                  string numeroEvento = objectPar !="-" ? StringSubstr(objectPar,StringLen(objectPar)-1,1) : 0;
                  if(numeroEvento >= 0) GraficoDoEvento(numeroEvento);
               }               
            }          
         }
        }
  
  
        
     }
     
   // ao digitar os pares custom e dar enter
   //if(EsconderDisplayParesCustom==true)
   //   {
   //   if(id==CHARTEVENT_OBJECT_ENDEDIT)
   //     {
   //      InsereParesCustom();
   //     }
   //   } 
   
   //Macete pra resolver erro de alguns ativos com historico grande que o
   //iClose demora pra carregar, eu recarrego o grafico mudando o timeframe
   if(MovimentacaoParHoje==DistanciaMediana)
      {
      ChartSetSymbolPeriod(0,Symbol(),PERIOD_CURRENT); 
      }
  ChartRedraw(); 
  }

// Variaveis
string SimboloFinalAtivo;
string NomeCorretora;
string TextoMediana;
double Topo;
double Fundo;
double Mediana;
int MenorCandle, MaiorCandle;
double ArrayPrecosHistoricos[120];
double DistanciaMediana;
double PontosHoje;
string Orientacao;
int OrientacaoJPY = 1;
double MediaMovDiario;
string OrientacaoFundoOuTopo;
string TextoLoteDisponivel;
static datetime TimerAguardar;
static datetime TimerAguardar2;
static datetime TimerAguardar3;
int AlertaLucro = 0;
double PositionProfit = 0.0;
bool EsconderDisplayBtn = false;
bool EsconderMenuSecundario = false;
bool EsconderDisplayPares = false;
bool EsconderDisplayParesCustom = false;
bool EsconderDisplayParesPrecos = false;
bool EsconderDisplayForcaMoeda = false;
bool EsconderDisplayExposicao = false;
bool EsconderDisplayDadosEconomicos = false;
bool EsconderDisplayOperacoesAbertas = false;
MqlDateTime Tempo;
int PosicoesAbertasNoPar;
double LotesUsadosNoPar;
int DiversificacaoPares;    
static ENUM_TIMEFRAMES TimeFrameCopy;
// Variaveis Dinamicas
double PrecoAsk;
double PrecoBid;
double SwapVenda;
double SwapCompra;
int SpreadAtual;
double MovimentacaoParHoje;
double PorcMovNoMomento;
double FechamentoDiaAnteriorPar;
string forcaTimeFrame;
string paresTimeFrame;
string MoedaBasePais=SymbolInfoString(Symbol(),SYMBOL_CURRENCY_BASE);

// funcao que pega as variaveis dinamicas
bool PegaVariaveisDinamicas(){
   PrecoAsk = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   PrecoBid = SymbolInfoDouble(Symbol(),SYMBOL_BID);
   SwapVenda = SymbolInfoDouble(Symbol(),SYMBOL_SWAP_SHORT);
   SwapCompra = SymbolInfoDouble(Symbol(),SYMBOL_SWAP_LONG);
   SpreadAtual = SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);
   PontosHoje = PrecoBid - iClose(_Symbol,PERIOD_D1,1); // Fechamento Dia Anterior

   return(true);
}


// Orientação de compra ou venda e SWAP
string ChamaOrientacao(){
   Mediana = CalculaTopoFundo(MesesHistoricos);
   double MargemAteOndeOperar;
   //Pega PontosAteMediana nas configuracoes
   double PontosDistanciaMediana = PontosAteMediana*0.00001; 

   //Print("preco: ",PrecoBid," Mediana:",Mediana);   
   if(PrecoBid>Mediana)  
     {
     
      TextoMediana = "Acima Mediana:";
      MargemAteOndeOperar = Mediana + PontosDistanciaMediana*OrientacaoJPY;
      
         if(PrecoBid>MargemAteOndeOperar)
         {
            Orientacao="VENDA";           
            OrientacaoFundoOuTopo = "Topo:";
            CorQuadroOrientacao = clrCrimson;
         }
         else if(PrecoBid<MargemAteOndeOperar)
         {   
            Orientacao="NEUTRO";
            OrientacaoFundoOuTopo = " ";
            CorQuadroOrientacao = clrBlack;
         } 
     }
   else if(PrecoBid<Mediana)
     {
      TextoMediana = "Abaixo Mediana:";
      MargemAteOndeOperar = Mediana - PontosDistanciaMediana*OrientacaoJPY;
      //Print("preco: ",PrecoBid," - Mediana:",Mediana," - margen operar: ",MargemAteOndeOperar," - Pontos",PontosAteMediana); 
         if(PrecoBid<MargemAteOndeOperar)
         {
            Orientacao="COMPRA";        
            OrientacaoFundoOuTopo = "Fundo:";
            CorQuadroOrientacao = clrMediumBlue;
         }
         else if(PrecoBid>MargemAteOndeOperar)
         {   
            Orientacao="NEUTRO";
            OrientacaoFundoOuTopo = " ";
            CorQuadroOrientacao = clrBlack;
         }     
     }
   return(Orientacao);  
}

//+------------------------------------------------------------------+
//| Calculo Topo e Fundo                                             |
//+------------------------------------------------------------------+
//struct historicoAtivo {
//   double Topo;
//   double Fundo;
//   double Mediana;
//   double PrecoMedio;
//};
//
//historicoAtivo PegarHistorico(historicoAtivo &ativo, int Meses)
//{
//      double SomaPrecoMedio = 0.0;
//      int TempSoma = 0;
//      
//      // Array com os preços dos ultimos anos
//      for(int i=0;i<Meses;i++)
//      {
//         TempSoma = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i),5);
//         ArrayPrecosHistoricos[i] = TempSoma;
//         SomaPrecoMedio += TempSoma;
//      }
//      
//      MenorCandle = ArrayMinimum(ArrayPrecosHistoricos,0,Meses);
//      MaiorCandle = ArrayMaximum(ArrayPrecosHistoricos,0,Meses);
//     
//      ativo.Topo = ArrayPrecosHistoricos[MaiorCandle];
//      ativo.Fundo= ArrayPrecosHistoricos[MenorCandle];
//        
//      Mediana = (Topo + Fundo) / 2;
//                         
//      ativo.Mediana = NormalizeDouble(Mediana,5);
//      ativo.PrecoMedio = SomaPrecoMedio/Meses; 
//     
//   return ativo;
//}

//+------------------------------------------------------------------+
//| Mostra a Diversificação de Pares Diferentes Operados             |
//+------------------------------------------------------------------+
int CalculaQtdDiversificacaoPares()
{
   CArrayString array; //uso de biblioteca à parte para poder ordenar array de strings 
   string ParesDiferentes[];

   for(int i=0;i<PositionsTotal();i++)
   {
      PositionGetTicket(i);
      array.Add(PositionGetString(POSITION_SYMBOL));  
   }
   
   array.Sort();
   int n = array.Total();
   int j = 0;
   ArrayResize(ParesDiferentes,n);  
   
   for(int i=0;i<n-1;i++)
   {
      if(array[i] != array[i+1])
      {
         ParesDiferentes[j++] = array[i]; 
      }
   }
   //guarda ultimo item
   j += 1;
   ArrayResize(ParesDiferentes,j);
   ParesDiferentes[j-1] = array[n-1];
   
   
return(ArraySize(ParesDiferentes));
}

bool ArrayParesOperados(string &ArrayPares[])
{
   CArrayString array; //uso de biblioteca à parte para poder ordenar array de strings
   string SymbolTemp;

   for(int i=0;i<PositionsTotal();i++)
   {
      PositionGetTicket(i);
      // preciso retirar o final caso a corretora tenha
      SymbolTemp = PositionGetString(POSITION_SYMBOL);
      SymbolTemp =  StringFind(AccountInfoString(ACCOUNT_COMPANY), "W7 Limited") >=0 || LetrasFinalPares!="" ? StringSubstr(SymbolTemp,0,StringLen(SymbolTemp)-2) : SymbolTemp;
      array.Add(SymbolTemp);
   }
   
   array.Sort();
   int n = array.Total();
   
   int j = 0;
   ArrayResize(ArrayPares,n);  
   
   for(int i=0;i<n-1;i++)
   {
      if(array[i] != array[i+1])
      {
         ArrayPares[j++] = array[i]; 
      }
   }
   //guarda ultimo item
   j += 1;
   ArrayResize(ArrayPares,j);
   ArrayPares[j-1] = array[n-1];
   
return(true);
}
 
double CalculaTopoFundo(int Meses){           
      // Considerar Pandemia para calcular Array com os preços dos ultimos anos
      if(PularPandemiaTopoFundo==true)
        {
         int MesPular1=iBarShift(_Symbol,PERIOD_MN1,D'2020.03.01 00:00');
         int MesPular2=iBarShift(_Symbol,PERIOD_MN1,D'2020.04.01 00:00');
         
         for(int i=0;i<Meses;i++)
         {
         if(i == MesPular1)
           {
            ArrayPrecosHistoricos[i] = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i+1),5);
           }
         else if(i == MesPular2)
           {
            ArrayPrecosHistoricos[i] = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i-1),5);
           }
         else
           {
            ArrayPrecosHistoricos[i] = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i),5);
           }  
         }
      }
      else
        {
        // Array com os preços dos ultimos anos
        for(int i=0;i<Meses;i++)
          {
           ArrayPrecosHistoricos[i] = NormalizeDouble(iClose(_Symbol,PERIOD_MN1,i),5);
          }   
        }
      
      MenorCandle = ArrayMinimum(ArrayPrecosHistoricos,0,Meses);
      MaiorCandle = ArrayMaximum(ArrayPrecosHistoricos,0,Meses);
     
      Topo = ArrayPrecosHistoricos[MaiorCandle];
      Fundo= ArrayPrecosHistoricos[MenorCandle];
        
      Mediana = (Topo + Fundo) / 2;

return(Mediana);
}

double CalculaPrecoMedio(string ativo, string tempoUsado, int QtdCandles){           
      double SomaPrecoMedio = 0.0;
      ENUM_TIMEFRAMES timeframe;
   
      if(tempoUsado == "dias") timeframe = PERIOD_D1;
      else if(tempoUsado == "meses") timeframe = PERIOD_MN1;
   
      for(int i=0;i<QtdCandles;i++)
      {
         SomaPrecoMedio += iClose(ativo,timeframe,i);
      }
      //Print("Ativo: ",ativo," - Tempo: ",tempoUsado," - Candles: ",QtdCandles);
return(SomaPrecoMedio/QtdCandles);
}

double CalculaMediaMovDiaria(int iPeriodo)
{ 
   double pontos = 0.0;
   for(int i=0;i<iPeriodo;i++)
     {
      pontos += iHigh(Symbol(),PERIOD_D1,i)-iLow(Symbol(),PERIOD_D1,i);
     }
   
   return pontos/iPeriodo;
}

double CalculaMovParMomento(int iPeriodo)
{ 

   double MovParMomento = iHigh(Symbol(),PERIOD_D1,0)-iLow(Symbol(),PERIOD_D1,0);
   
   return MovParMomento;
}

bool EsconderOuMostraDisplay(){

   if(EsconderDisplayBtn==false)
      {
           EsconderDisplayBtn = true;
           ObjectsDeleteAll(0,0,OBJ_TEXT);
           ObjectsDeleteAll(0,0,OBJ_RECTANGLE_LABEL);
           ObjectsDeleteAll(0,0,OBJ_LABEL);
           ObjectDelete(0, "MenuSecundarioBtn");
           RemoveOutrosDisplays("tudo");
           CriaDisplayLotes(); // visual
      }
      else
      {
         CriaDisplay();
         
         // Informacoes que sao constantemente alimentadas
         EscreveInformacoesDinamicas(
         PosicoesAbertasNoPar,
         DiversificacaoPares,
         LotesUsadosNoPar,
         TextoMediana,
         DistanciaMediana,
         MediaMovDiario,
         MovimentacaoParHoje,
         PorcMovNoMomento,
         SwapCompra,
         SwapVenda,
         SpreadAtual,
         OrientacaoFundoOuTopo,
         Orientacao,
         CorQuadroOrientacao
         );
         EsconderDisplayBtn = false;
      }
   ChartRedraw();        
   return(true);
}

bool EsconderOuMostraMenuSecundario(){

   if(EsconderMenuSecundario==false)
      {  
         CriaMenuSecundarioPainel();
         //esconde os outros
         EsconderMenuSecundario = true; 
      }
   else
     {
      EsconderMenuSecundario = false;
      //esconde proprio display
      ObjectDelete(0, "FundoMenuSecundario");
      ObjectDelete(0, "DisplayParesBtn");
      ObjectDelete(0, "DisplayForcaMoedaBtn");
      ObjectDelete(0, "ExposicaoMoedasBtn");
      ObjectDelete(0, "DisplayParesPrecosBtn");
      ObjectDelete(0, "DisplayParesCustomBtn");
      ObjectDelete(0, "DisplayDadosEconomicosBtn");
      ObjectDelete(0, "OperacoesAbertasBtn");
     }
   ChartRedraw();        
   return(true);
}

bool EsconderOuMostraDisplayPares(){

   if(EsconderDisplayPares==false)
      {
         if(AbrirPaineisJuntos==false) RemoveOutrosDisplays("tudo");
         CriarDisplayPares();      
         CriaMenuSecundarioPainel();
         EsconderMenuSecundario = true;
         EsconderDisplayPares = true; 
      }
   else
     {
      RemoveOutrosDisplays("pares");
     }
   ChartRedraw();        
   return(true);
}


bool EsconderOuMostraDisplayForca(){

   if(EsconderDisplayForcaMoeda==false)
      {      
         if(AbrirPaineisJuntos==false) RemoveOutrosDisplays("tudo");
         CriarDisplayForcaMoeda();        
         CriaMenuSecundarioPainel();
         EsconderMenuSecundario = true;
         EsconderDisplayForcaMoeda = true;
      }
   else
     {
      RemoveOutrosDisplays("forca");
     }
   ChartRedraw();        
   return(true);
}

bool EsconderOuMostraDisplayDadosEconomicos(){

   if(EsconderDisplayDadosEconomicos==false)
      {      
         if(AbrirPaineisJuntos==false) RemoveOutrosDisplays("tudo");
         CriarDadosEconomicos();        
         CriaMenuSecundarioPainel();
         EsconderMenuSecundario = true;
         EsconderDisplayDadosEconomicos = true;
      }
   else
     {
      RemoveOutrosDisplays("dadosEconomicos");
     }        
   return(true);
}

bool EsconderOuMostraDisplayOperacoesAbertas(){

   if(EsconderDisplayOperacoesAbertas==false)
      {      
         if(AbrirPaineisJuntos==false) RemoveOutrosDisplays("tudo");
         TodasOperacoesAbertas();        
         CriaMenuSecundarioPainel();
         EsconderMenuSecundario = true;
         EsconderDisplayOperacoesAbertas = true;
      }
   else
     {
      RemoveOutrosDisplays("operacoesAbertas");
     }        
   return(true);
}

bool EsconderOuMostraDisplayExposicao(){

   if(EsconderDisplayExposicao==false)
      {      
         if(AbrirPaineisJuntos==false) RemoveOutrosDisplays("tudo");
         CriaMenuSecundarioPainel();
         EsconderMenuSecundario = true;
         CalculaExposicaoMoedas();
      }
   else
     {
      CalculaExposicaoMoedas();
     }        
   return(true);
}


bool EsconderOuMostraDisplayCustom(){

   if(EsconderDisplayParesCustom==false)
      {         
         if(AbrirPaineisJuntos==false) RemoveOutrosDisplays("tudo");
         CriarDisplayCustom();        
         CriaMenuSecundarioPainel();
         EsconderMenuSecundario = true;
         EsconderDisplayParesCustom = true;      
      }
   else
     {
      RemoveOutrosDisplays("custom");
     }
   ChartRedraw();        
   return(true);
}


bool EsconderOuMostraDisplayPrecos(){

   if(EsconderDisplayParesPrecos==false)
      {
         if(AbrirPaineisJuntos==false) RemoveOutrosDisplays("tudo");
         CriarDisplayPrecos();        
         CriaMenuSecundarioPainel();
         EsconderMenuSecundario = true;
         EsconderDisplayParesPrecos = true;  
      }
   else
     {
      RemoveOutrosDisplays("precos");
     }
   ChartRedraw();        
   return(true);
}


bool RemoveOutrosDisplays(string remove){

int LinhasDeletar = 15;
if(EsconderDisplayOperacoesAbertas == true)
  {
   LinhasDeletar = PositionsTotal();
  }

if(remove == "tudo")
  {
   EsconderMenuSecundario = false;
   EsconderDisplayPares = false; 
   EsconderDisplayForcaMoeda = false; 
   EsconderDisplayDadosEconomicos = false;
   EsconderDisplayOperacoesAbertas = false;
   EsconderDisplayParesPrecos = false;
   EsconderDisplayParesCustom = false;

   ObjectDelete(0, "FundoMenuSecundario");
   ObjectDelete(0, "DisplayParesBtn");
   ObjectDelete(0, "DisplayForcaMoedaBtn");
   ObjectDelete(0, "ExposicaoMoedasBtn");
   ObjectDelete(0, "DisplayParesPrecosBtn");
   ObjectDelete(0, "DisplayParesCustomBtn");
   ObjectDelete(0, "DisplayDadosEconomicosBtn");
   ObjectDelete(0, "OperacoesAbertasBtn");   
  }
   
   // remover colunas e linhas
   for(int i=0;i<12;i++)
     {
      for(int q=0;q<LinhasDeletar;q++)
        {
        if(remove == "tudo")
         {     

            ObjectDelete(0, "label1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "label2_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "label3_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelParesTimeFrame_"+IntegerToString(q));             
            
            ObjectDelete(0, "labelForca_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelForcaTimeFrame_c0_l"+IntegerToString(q));            
             
            ObjectDelete(0, "labelDadosEconomicos_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelDadosEconomicosTimeFrame_"+IntegerToString(q));
            ObjectDelete(0, "labelDadosEconomicosMoeda_c0_l"+IntegerToString(q));          
            
            ObjectDelete(0, "labelOperacoes1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelOperacoes2_c"+IntegerToString(i)+"_l"+IntegerToString(q));    
             
            ObjectDelete(0, "labelPrecos1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelPrecos2_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelPrecos3_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            
            ObjectDelete(0, "labelParesCustom1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelParesCustom2_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelParesCustom3_c"+IntegerToString(i)+"_l"+IntegerToString(q));
            ObjectDelete(0, "labelParesCustomTimeFrame_"+IntegerToString(q));
         }
        else if(remove == "pares")
         {

               ObjectDelete(0, "label1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "label2_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "label3_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelParesTimeFrame_"+IntegerToString(q));             
               EsconderDisplayPares = false;                   

         }
        else if(remove == "forca")
         {

               ObjectDelete(0, "labelForca_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelForcaTimeFrame_c0_l"+IntegerToString(q));            
               EsconderDisplayForcaMoeda = false;                   

         }
        else if(remove == "dadosEconomicos")
         {

               ObjectDelete(0, "labelDadosEconomicos_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelDadosEconomicosTimeFrame_"+IntegerToString(q));
               ObjectDelete(0, "labelDadosEconomicosMoeda_c0_l"+IntegerToString(q));          
               EsconderDisplayDadosEconomicos = false;                   

         }
        else if(remove == "operacoesAbertas")
         {
               ObjectDelete(0, "labelOperacoes1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelOperacoes2_c"+IntegerToString(i)+"_l"+IntegerToString(q));    
               EsconderDisplayOperacoesAbertas = false;                   
         }        
        else if(remove == "precos")
         {

               ObjectDelete(0, "labelPrecos1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelPrecos2_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelPrecos3_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               EsconderDisplayParesPrecos = false;                    

         }             
        else if(remove == "custom")
         {

               ObjectDelete(0, "labelParesCustom1_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelParesCustom2_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelParesCustom3_c"+IntegerToString(i)+"_l"+IntegerToString(q));
               ObjectDelete(0, "labelParesCustomTimeFrame_"+IntegerToString(q));
               EsconderDisplayParesCustom = false;                 
         }
        }
     }

return(true);
}


bool ChamaAlertaLucro(string NomePares){
   
      if(TimeCurrent() >= TimerAguardar3 && PositionProfit>=AlertaLucroEscolha)
      {
         Alert("Lucro no ",NomePares," de: $",DoubleToString(PositionProfit,2));
         if(AlertaLucroCelular==true) SendNotification("Lucro no "+NomePares+" de: $"+DoubleToString(PositionProfit,2));
         TimerAguardar3 = TimeCurrent() + AlertaLucroTempoEscolha; // alertas em segundos
      }         
   
   return(true);
}

struct account {
   double lots;
   double money;
   double balance;
   string currency;
   double marginLevel;
   double float_profit;
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
account getStats(account &stats) {

   double money= 0;
   double lots = 0;

   for(int i=0; i<PositionsTotal(); i++) {
      ulong ticket;
      if((ticket=PositionGetTicket(i))>0) {// if the position is selected
         double positionLosts = PositionGetDouble(POSITION_VOLUME);
         lots=lots+positionLosts;
     }
   }
   
   stats.balance = AccountInfoDouble(ACCOUNT_BALANCE);
   stats.money = AccountInfoDouble(ACCOUNT_EQUITY);
   stats.currency = AccountInfoString(ACCOUNT_CURRENCY);
   stats.lots= NormalizeDouble(lots, 2);
   stats.marginLevel = AccountInfoDouble(ACCOUNT_MARGIN_LEVEL);
   stats.float_profit= AccountInfoDouble(ACCOUNT_PROFIT);
   
   return stats;
}
//+------------------------------------------------------------------+

double getMoney(account &stats) {
   return stats.balance;
}


// Saber a moeda base operada
//Print(SymbolInfoString(_Symbol,SYMBOL_CURRENCY_BASE));

// funcao seta variasveis dinamicas
bool  EscreveInformacoesDinamicas(
   double PosicoesAbertasNoPar,
   int DiversificacaoPares,
   double LotesUsadosNoPar,
   string TextoMediana,
   double DistanciaMediana,
   double MediaMovDiario,
   double MovimentacaoParHoje,
   double PorcMovNoMomento,
   double SwapCompra,
   double SwapVenda,
   int SpreadAtual,
   string OrientacaoFundoOuTopo,
   string Orientacao,
   color CorQuadroOrientacao
)
   {
      // Variaveis do Display do Indicador
      account status; // instacia variavel status com tipo personalizado account
      getStats(status);
      
      double DrawDown = 0.0;
      double NiveldeMargem = status.marginLevel;
      if (getMoney(status) !=0) DrawDown = (status.float_profit/getMoney(status))*-100;
      
      CalculaLotes();
   
      // CORES MOV. PONTOS
      string SubidaQueda;
      if(MovimentacaoParHoje<0)
        {
         SubidaQueda = "Queda ";
         MovimentacaoParHoje = MovimentacaoParHoje*-1;
         PorcMovNoMomento = PorcMovNoMomento*-1;
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_COLOR,clrSalmon);
        }
      else
        {
         SubidaQueda = "Subida ";
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_COLOR,clrLimeGreen);
        }
   
      // Valor Diversificacao Pares Diferentes Operados DINÂMICO
      ObjectSetString(0,"ValorDiversificacaoPares",OBJPROP_TEXT,DiversificacaoPares+" Pares");
   
      // Valor Quantidade de Posicoes Abertas nesse Par DINÂMICO
      ObjectSetString(0,"ValorQtdPosicaoAberta",OBJPROP_TEXT,DoubleToString(PosicoesAbertasNoPar,0));
   
      // Valor Lotes Operados nesse Par DINÂMICO
      ObjectSetString(0,"ValorLotesOperadosNoPar",OBJPROP_TEXT,DoubleToString(LotesUsadosNoPar,2));
   
      // Valor Distancia Mediana DINÂMICO
      ObjectSetString(0,"DistanciaMediana",OBJPROP_TEXT,TextoMediana);
      double ReferenciaMediana = PrecoBid>Mediana ? (Topo - Mediana)*100000/OrientacaoJPY : (Fundo - Mediana)*100000/OrientacaoJPY;
      double PorcentagemDistanciaMediana = ReferenciaMediana!=0 ? ((DistanciaMediana)/ReferenciaMediana)*100 : 0;
      ObjectSetString(0,"ValorDistanciaMediana",OBJPROP_TEXT,DoubleToString(DistanciaMediana,0) + "Pts("+DoubleToString(PorcentagemDistanciaMediana,0)+"%)");

      // Valor Media Pontos Por Dia Par DINÂMICO
      ObjectSetString(0,"ValorMediaMovDiario",OBJPROP_TEXT,DoubleToString(MediaMovDiario,0) + "Pts"); 

      // Valor Movimentacao Par DINÂMICO
      ObjectSetString(0,"ValorMovimentacaoParHoje",OBJPROP_TEXT,SubidaQueda + DoubleToString(MovimentacaoParHoje,0) + "Pts("+DoubleToString(PorcMovNoMomento,1)+"%)");      
      
      double ValorLoteAtivo = CalculaValorLoteAtivo(Symbol(),1.0)/100;
      // Valor Por Ponto DINÂMICO
      ObjectSetString(0,"ValorLucroPontoPorLote",OBJPROP_TEXT,DoubleToString(ValorLoteAtivo,5));      
      
      // Valor Swap Compra DINÂMICO
      ObjectSetString(0,"ValorSwapCompra",OBJPROP_TEXT,DoubleToString(SwapCompra,2));
     
      // Valor Swap Venda DINÂMICO
      ObjectSetString(0,"ValorSwapVenda",OBJPROP_TEXT,DoubleToString(SwapVenda,2));
   
      // Valor Spread DINÂMICO
      ObjectSetString(0,"ValorSpread",OBJPROP_TEXT,SpreadAtual);

      // Valor Nível de Margem DINÂMICO
      ObjectSetString(0,"ValorNiveldeMargem",OBJPROP_TEXT,DoubleToString(NiveldeMargem,2)+"%");   

      // Valor DrawDown DINÂMICO
      ObjectSetString(0,"ValorDrawDown",OBJPROP_TEXT,DoubleToString(DrawDown,2)+"%");

      // Topo ou Fundo DINÂMICO
      ObjectSetString(0,"OrientacaoTopoFundo",OBJPROP_TEXT,OrientacaoFundoOuTopo);
      
      // Orientacao Compra, Vende ou Aguarda
      ObjectSetString(0,"OrientacaoCompraVenda",OBJPROP_TEXT,Orientacao);
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_BGCOLOR, CorQuadroOrientacao);
   
      // CORES SWAP e SPREAD 
      if(SwapCompra>0.0)
      {
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_COLOR,clrDodgerBlue);
      }
      else
      {
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_COLOR,clrSalmon);
      }
      
      if(SwapVenda>0.0)
      {
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_COLOR,clrDodgerBlue);
      }
      else
      {
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_COLOR,clrSalmon);
      }
      
      if(SpreadAtual>=50)
      {
         ObjectSetInteger(0,"ValorSpread",OBJPROP_COLOR,clrSalmon);
      }
      else if(SpreadAtual<50 && SpreadAtual>30)
      {
         ObjectSetInteger(0,"ValorSpread",OBJPROP_COLOR,clrDodgerBlue);
      }
      else if(SpreadAtual<=30)
      {
         ObjectSetInteger(0,"ValorSpread",OBJPROP_COLOR,clrLimeGreen);
      }
            
   return(true);
}
              
bool CalculaExposicaoMoedas()
{
   //--- create chart
   CPieChart pie_chart;
   int Width=600;
   int Height=300;

   if(!pie_chart.CreateBitmapLabel("PieChart",DisplayLarguraBackgroud,25,Width,Height))
     {
      Print("Error creating pie chart: ",GetLastError());
     }
   
   if(EsconderDisplayExposicao == false)
     {

      string ParesSymbolFirst[][2];
      string ParesSymbolSecond[][2];
      ArrayResize(ParesSymbolFirst,PositionsTotal(),2);
      ArrayResize(ParesSymbolSecond,PositionsTotal(),2);
      string AtivoTemp;
      // pego os pares operados
      for(int i=0;i<PositionsTotal();i++)
         {
         for(int j=0;j<1;j++)
           {
            PositionGetTicket(i);
            AtivoTemp = PositionGetString(POSITION_SYMBOL);
            if(StringLen(AtivoTemp) < 8)
              {
               ParesSymbolFirst[i][0] = StringSubstr(AtivoTemp,0,StringLen(AtivoTemp)-2);
               ParesSymbolFirst[i][1] = PositionGetDouble(POSITION_VOLUME);
               ParesSymbolSecond[i][0] = "";
               ParesSymbolSecond[i][1] = "";                 
              }
            else
              {
               ParesSymbolFirst[i][0] = SymbolInfoString(AtivoTemp,SYMBOL_CURRENCY_BASE);
               ParesSymbolFirst[i][1] = PositionGetDouble(POSITION_VOLUME);
               ParesSymbolSecond[i][0] = SymbolInfoString(AtivoTemp,SYMBOL_CURRENCY_PROFIT);
               ParesSymbolSecond[i][1] = PositionGetDouble(POSITION_VOLUME);           
              }
           }    
         }
   
      string ArrayPares[];
      ArrayParesOperados(ArrayPares); //pares operados de forma ordenada e sem duplicação
      
      string ArrayMoedas[];
      ArrayResize(ArrayMoedas,ArraySize(ArrayPares)*2);
      // pego as moedas operadas
      for(int i=0;i<ArraySize(ArrayPares);i++)
        {
         AtivoTemp = ArrayPares[i];
         if(StringLen(AtivoTemp) < 6)
           {
            ArrayMoedas[i] = ArrayPares[i];
           }
         else
           {
            ArrayMoedas[i] = StringSubstr(ArrayPares[i],0,3); 
           }
        }
      // faço separado em 2 etapas para separar as moedas dos pares
      for(int i=0;i<ArraySize(ArrayPares);i++)
        {
         AtivoTemp = ArrayPares[i];
         if(StringLen(AtivoTemp) < 6)
           {
            ArrayMoedas[ArraySize(ArrayPares)+i] = "";
           }
         else
           {
            ArrayMoedas[ArraySize(ArrayPares)+i] = StringSubstr(ArrayPares[i],3,3);
           }
        }
        
      RemoveArrayDuplicadoString(ArrayMoedas); // removo duplicados das moedas operadas
      
      double ArrayVolume[];
      ArrayResize(ArrayVolume,ArraySize(ArrayMoedas));
   
      // zerando o Array para popular novamente
      for(int i=0;i<ArraySize(ArrayVolume);i++)
      { 
         ArrayVolume[i] = 0.0;
      }
      int ArrCountOperacoes[];
      ArrayResize(ArrCountOperacoes,ArraySize(ArrayMoedas));
      // crio novo array com os valores dos lotes ordenados com o array de moedas
      for(int i=0;i<ArraySize(ArrayMoedas);i++)
        {
        ArrCountOperacoes[i] = 0;
        for(int j=0;j<PositionsTotal();j++)
          {
           if(ArrayMoedas[i] == ParesSymbolFirst[j][0])
             {
              ArrayVolume[i] += StringToDouble(ParesSymbolFirst[j][1]);
              ArrCountOperacoes[i] += 1;
             }
           if(ArrayMoedas[i] == ParesSymbolSecond[j][0])
             {
              ArrayVolume[i] += StringToDouble(ParesSymbolSecond[j][1]);
              ArrCountOperacoes[i] += 1;
             }
          }
        }     

      //--- draw
      for(uint i=0;i<ArraySize(ArrayMoedas);i++)
        {
         pie_chart.ValueAdd(ArrayVolume[i],ArrayMoedas[i]+" "+DoubleToString(ArrayVolume[i],2)+" em "+ArrCountOperacoes[i],RandomRGB());
         Sleep(10);
        }
      pie_chart.LegendAlignment(ALIGNMENT_RIGHT);
      Sleep(2000);     
      //--- enable all
      pie_chart.ShowLegend();
      pie_chart.ShowValue();
      pie_chart.ShowDescriptors();
   
      Sleep(2000);
    
      for(int i=1;i<500;i++)
        {
         pie_chart.DataOffset(pie_chart.DataOffset()+i);
         Sleep(200);
        }
      
     EsconderDisplayExposicao = true; 
   }
   else
     {
      pie_chart.Destroy();
      EsconderDisplayExposicao = false;
     }
   

return(true);
}


bool CalculaLotes(){

      account status; // instacia variavel status com tipo personalizado account
      getStats(status);
      
      double maxLots = NormalizeDouble(MathFloor(getMoney(status) / LoteProporcional) * 0.01, 2);
      double lotsAvailable = maxLots - status.lots;
            
      string TextoLoteDisponivel;
      // Valor Lote em Uso DINÂMICO
      double PorcentagemLotesDisponivel = maxLots!=0 ? ((maxLots-lotsAvailable)/maxLots)*100 : 0;
      ObjectSetString(0,"ValorLoteUso",OBJPROP_TEXT,DoubleToString(status.lots,2)+" ("+DoubleToString(PorcentagemLotesDisponivel,1)+"%)");
   
      // Valor Lote Disponivel DINÂMICO   
      ObjectSetString(0,"ValorLoteDisponivel",OBJPROP_TEXT,DoubleToString(lotsAvailable,2));

      if(lotsAvailable<0 && status.lots>maxLots)
      {
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_COLOR,clrSalmon);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_COLOR,clrSalmon);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSalmon);
         TextoLoteDisponivel = "Ultrapassou:";
         lotsAvailable = lotsAvailable * -1;        
      }
      else
      {
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_COLOR,clrSnow);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSnow);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_COLOR,clrLimeGreen);
         TextoLoteDisponivel = "Lote Disponível:";               
      }
      
      ObjectSetString(0,"LoteDisponivel",OBJPROP_TEXT,TextoLoteDisponivel);
      
return(true);
}

//+------------------------------------------------------------------+
//| Random RGB color                                                 |
//+------------------------------------------------------------------+
uint RandomRGB(void)
  {
   return(XRGB(rand()%255,rand()%255,rand()%255));
  }


bool RemoveArrayDuplicadoString(string &ArrayPares[])
{
   CArrayString array; //uso de biblioteca à parte para poder ordenar array de strings

   for(int i=0;i<ArraySize(ArrayPares);i++)
   {
      array.Add(ArrayPares[i]);
   }
   
   array.Sort();
   int n = array.Total();
   
   int j = 0;
   ArrayResize(ArrayPares,n);  
   
   for(int i=0;i<n-1;i++)
   {
      if(array[i] != array[i+1])
      {
         ArrayPares[j++] = array[i]; 
      }
   }
   //guarda ultimo item
   j += 1;
   ArrayResize(ArrayPares,j);
   ArrayPares[j-1] = array[n-1];
   
return(true);
}

double CalculaValorLoteAtivo(string ativo, double VolumeLote)
{   
   double TickSize  = SymbolInfoDouble(ativo,SYMBOL_TRADE_TICK_SIZE);
   double TickValue = SymbolInfoDouble(ativo,SYMBOL_TRADE_TICK_VALUE);
   double PointSize = SymbolInfoDouble(ativo,SYMBOL_POINT);
   double PointValue = TickSize!=0 ? ((TickValue * PointSize)/TickSize)*100 : 0;
   double PointValueLots = PointValue * VolumeLote;
   
   return(PointValueLots);
}