//+------------------------------------------------------------------+  
// VARIAVEIS GLOBAIS                 |  
//+------------------------------------------------------------------+

string ParesPrincipais1[14] = {"AUDCAD","AUDCHF","AUDJPY","AUDNZD","AUDUSD","CADCHF","CADJPY","CHFJPY",
"EURAUD","EURCAD","EURCHF","EURGBP","EURJPY","EURNZD"};

string ParesPrincipais2[14] = {"EURUSD","GBPAUD","GBPCAD","GBPCHF","GBPJPY","GBPNZD","GBPUSD","NZDCAD",
"NZDCHF","NZDJPY","NZDUSD","USDCAD","USDCHF","USDJPY"};

int NoticiasID[10]; // usado nos dados economicos

bool CriarDisplayPares()
{
   int numLinhas = 15;
   int numColunas = 11;
   int altura = 21;
   int largura = 50;
   int larguraAumento = 23;
   
   // CRIAR COLUNAS E LINHAS
   int label1Espacamento = AfastarPaineisAEsquerda == true ? DisplayLarguraBackgroud+1 : 0; //verifica se a opcao esta habilitada pra afastar
   int label2Espacamento = (numColunas*largura)-largura*1.3+label1Espacamento;
   string objName;
   int x,y;
   int xPadding = 0;
   int yPadding = 52;
   color corFundo = clrSnow;
   color corTexto = clrDarkSlateGray;
   
   // localizacao canto direito superior
   if(LocalizacaoDisplay == 4)
   {
      //xPadding = -45;
   }
   // tamanho maior do display
   if(TamanhoDisplay == 2)
   {
      xPadding = 30;
      if(LocalizacaoDisplay == 4)
      {
         xPadding = -75;
      } 
   }  
   
   for(int i=0;i<numLinhas;i++)
   {  
      //PRIMEIRO BLOCO  
      for(int j=0;j<numColunas;j++)
      {
         objName = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i);
         x = xPadding + j*largura;
         y = yPadding + i*altura;

         // personalizar tamanho da largura pra ajustar itens   
         if(j==3)
           {
            CreateLabel(objName,x,y,largura+larguraAumento*2,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==4)
           {
            CreateLabel(objName,x+larguraAumento*2,y,largura+larguraAumento*2,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==5)
           {
            CreateLabel(objName,x+larguraAumento*4,y,largura+larguraAumento,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==6)
           {
            CreateLabel(objName,x+larguraAumento*5,y,largura,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==7)
           {
            CreateLabel(objName,x+larguraAumento*5,y,largura+larguraAumento,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==8)
           {
            CreateLabel(objName,x+larguraAumento*6,y,largura-larguraAumento*1.2,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==9)
           {
            CreateLabel(objName,x+larguraAumento*4.8,y,largura-larguraAumento*1.2,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==10)
           {
            CreateLabel(objName,x+larguraAumento*3.6,y,largura-larguraAumento*1.2,altura,label1Espacamento,corFundo,corTexto);
           }
         else
           {
            CreateLabel(objName,x,y,largura,altura,label1Espacamento,corFundo,corTexto);
           }          
      }

      //SEGUNDO BLOCO
      for(int k=0;k<numColunas;k++)
      {
         objName = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i);
         x = xPadding + 8 + k*largura + larguraAumento;
         y = yPadding + i*altura;  
         // personalizar tamanho da largura pra ajustar itens   
         if(k==3)
           {
            CreateLabel(objName,x+larguraAumento*4,y,largura+larguraAumento*2,altura,label2Espacamento,corFundo,corTexto);
           }
         else if(k==4)
           {
            CreateLabel(objName,x+larguraAumento*6,y,largura+larguraAumento*2,altura,label2Espacamento,corFundo,corTexto);
           }
         else if(k==5)
           {
            CreateLabel(objName,x+larguraAumento*8,y,largura+larguraAumento,altura,label2Espacamento,corFundo,corTexto);
           }
         else if(k==6)
           {
            CreateLabel(objName,x+larguraAumento*9,y,largura,altura,label2Espacamento,corFundo,corTexto);
           }
         else if(k==7)
           {
            CreateLabel(objName,x+larguraAumento*9,y,largura+larguraAumento,altura,label2Espacamento,corFundo,corTexto);
           }
         else if(k==8)
           {
            CreateLabel(objName,x+larguraAumento*10,y,largura-larguraAumento*1.2,altura,label2Espacamento,corFundo,corTexto);
           }
         else if(k==9)
           {
            CreateLabel(objName,x+larguraAumento*8.8,y,largura-larguraAumento*1.2,altura,label2Espacamento,corFundo,corTexto);
           }
         else if(k==10)
           {
            CreateLabel(objName,x+larguraAumento*7.6,y,largura-larguraAumento*1.2,altura,label2Espacamento,corFundo,corTexto);
           }
         else
           {
            CreateLabel(objName,x,y,largura,altura,label2Espacamento+larguraAumento*4,corFundo,corTexto);
           }    
      }
   }

   
   // INSERINDO TITULO
   string labelTitulo;
   string tituloPares[11] = {"ATIVO","PREÇO","AÇÃO","Comp/Vend/Spre","Cruzamento 6x21","MEDIANA","MEDIA","MOV","D1","W1","MN1"};
   string nomeTimeFrameEncurtado = paresTimeFrame == "SEMANA" ? StringSubstr(paresTimeFrame,0,StringLen(paresTimeFrame)-2) : paresTimeFrame;
   tituloPares[3] = trocarSWAPSPREADporLUCROPONTO==true ? "L.Ponto1.0" : "Comp/Vend/Spre";
   tituloPares[6] = "MED."+nomeTimeFrameEncurtado;
   tituloPares[7] = "MOV."+nomeTimeFrameEncurtado;
      
   corFundo = clrDarkSlateGray;
   corTexto = clrSnow;
   for(int i=1;i<numColunas;i++)
     {
      for(int j=0;j<numColunas;j++)
        {
         labelTitulo = "label"+IntegerToString(i)+"_c"+IntegerToString(j)+"_l0";
         MudarTituloDisplayPares(labelTitulo,tituloPares[j],corFundo,corTexto);
        }
     }
     
   // // BOTOES PARA MODIFICAR O TIMEFRAME DO CALCULO DOS PARES
   string ArrayTimeFrames[3] = {"DIA","SEMANA","MÊS"};
   int espacamentoTimeFrame;
   for(int i=0;i<ArraySize(ArrayTimeFrames);i++)
   {      
      objName = "labelParesTimeFrame_"+IntegerToString(i);
      x = 70;
      y = 31;
      largura = 65;
      altura = 21;
      espacamentoTimeFrame = label1Espacamento;
      if(i == 1) espacamentoTimeFrame = espacamentoTimeFrame + largura;
      else if(i == 2) espacamentoTimeFrame = espacamentoTimeFrame + largura*2;

      CreateLabelTimeFrame(objName,x,y,largura,altura,espacamentoTimeFrame,ArrayTimeFrames[i]);
      if(ArrayTimeFrames[i] == paresTimeFrame)
        {
         ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,C'115, 115, 115');
         ObjectSetInteger(0,objName,OBJPROP_COLOR,clrSnow);            
        }    
   }

       
   InsereDadosPares();

   
   ChartRedraw();
   return(true);
}


bool InsereDadosPares()
{   
   // Insere PARES dos Ativos Principais  
   for(int i=0;i<14;i++)
     {
      //bloco 1, 2
      MudarItensDisplayPares("label1_c0_l"+IntegerToString(i+1),ParesPrincipais1[i],10,clrOldLace,clrDarkSlateGray);
      MudarItensDisplayPares("label2_c0_l"+IntegerToString(i+1),ParesPrincipais2[i],10,clrOldLace,clrDarkSlateGray);

     }
     
   // Destaca a cor dos dos pares operados no momento
   string ArrayPares[];
   ArrayParesOperados(ArrayPares);
   for(int i=0;i<ArraySize(ArrayPares);i++)
   {
      for(int j=1;j<=14;j++)
      {
         string objectNameParesC1 = "label1_c0_l"+IntegerToString(j);
         string objectNameParesC2 = "label2_c0_l"+IntegerToString(j);     
      
         if(ArrayPares[i] == ObjectGetString(0, objectNameParesC1, OBJPROP_TEXT))
         {
            MudarCorFundo(objectNameParesC1,clrGold,clrBlack);
         }
         else if(ArrayPares[i] == ObjectGetString(0, objectNameParesC2, OBJPROP_TEXT))
         {
            MudarCorFundo(objectNameParesC2,clrGold,clrBlack);
         }
      }
   }     

   // INSERINDO DADOS DINAMICOS DOS PARES NAS COLUNAS
   DadosAtivo ativo;
   SwapSpread InfoAtivo;
   int numColunas = 11;
   string labelPares;
   color corTextoPares = clrSnow;
   color corFundo = clrSnow;
   color corTexto = clrDarkSlateGray;   
   int CasasDecimais;
   double ValorLoteAtivo;
   string SubidaOuQueda;
   color SubidaOuQuedaColor;
   double SubidaOuQuedaPeriodo;
   string ValorSwapSpred;
   string cruzamentoLinhas6x21;
   
   for(int i=0;i<14;i++)
   {
      //PRIMEIRO BLOCO
      PegarDadosPares(ativo, ParesPrincipais1[i], MesesHistoricos);
      for(int j=0;j<numColunas;j++)
      {
         //coluna2
         if(j==1)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            CasasDecimais = int(SymbolInfoInteger(ParesPrincipais1[i]+SimboloFinalAtivo,SYMBOL_DIGITS));
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.PrecoBidPar,CasasDecimais),8);
         }
         //coluna3
         else if(j==2)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarCorFundo(labelPares,ativo.OrientacaoColor,corTextoPares);
            MudarItensDisplayDados(labelPares,ativo.Orientacao,9); 
         }
         //coluna4
         else if(j==3)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            if(trocarSWAPSPREADporLUCROPONTO==true)
              {
               ValorLoteAtivo = CalculaValorLoteAtivo(ParesPrincipais1[i]+SimboloFinalAtivo,1.0)/100;
               MudarItensDisplayDados(labelPares,DoubleToString(ValorLoteAtivo,5),8);
              }
            else
              {
               PegarSwapSpread(InfoAtivo, ParesPrincipais1[i]+SimboloFinalAtivo);
               ValorSwapSpred = DoubleToString(InfoAtivo.SwapCompra,1) +"/ "+ DoubleToString(InfoAtivo.SwapVenda,1) +"/ "+ DoubleToString(InfoAtivo.SpreadAtual,0);
               MudarItensDisplayDados(labelPares,ValorSwapSpred,8);
              }
         }
         //coluna5
         else if(j==4)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            cruzamentoLinhas6x21 = CalculaCruzamento6x21(ParesPrincipais1[i]+SimboloFinalAtivo);
            MudarItensDisplayDados(labelPares, cruzamentoLinhas6x21 ,8);

            if(StringFind(cruzamentoLinhas6x21, "PROXIMO") >=0)
              {
               MudarCorFundoTexto(labelPares,clrPeru,corFundo,corTexto);
              }
            else
              {
               MudarCorFundoTexto(labelPares,corTexto,corFundo,corTexto);
              }           
              
            if(ativo.Orientacao=="COMPRA")
              {
               if(StringFind(cruzamentoLinhas6x21, "COMPRA") >=0)
                 {
                  MudarCorFundoTexto(labelPares,corTexto,clrLightBlue,corTexto);
                 }               
              }
            else if(ativo.Orientacao=="VENDA")
              {
               if(StringFind(cruzamentoLinhas6x21, "VENDA") >=0)
                 {
                  MudarCorFundoTexto(labelPares,corTexto,clrLightPink,corTexto);
                 }               
              }              

         }  
         //coluna6
         else if(j==5)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.DistMediana,0)+"("+DoubleToString(ativo.PorcentDistanciaMediana,0)+"%)",8);
         }  
         //coluna7
         else if(j==6)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.MovMedia,0),9); 
         }
         //coluna8
         else if(j==7)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            
            ativo.MovAgora = ativo.MovAgora<0 ? ativo.MovAgora*-1 : ativo.MovAgora;
            ativo.PorcentMov = ativo.PorcentMov<0 ? ativo.PorcentMov*-1 : ativo.PorcentMov;
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.MovAgora,0)+"("+DoubleToString(ativo.PorcentMov,0)+")%",8);
         }
         //coluna9
         else if(j==8)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_D1,1);
            // verifica para orientar simbolo e cor   
            if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
            else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; }
               
            MudarItensDisplayDados(labelPares,SubidaOuQueda,10);
            MudarCorFundo(labelPares,SubidaOuQuedaColor,corTextoPares);
         }
         //coluna10
         else if(j==9)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_D1,7);
            // verifica para orientar simbolo e cor   
            if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
            else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; } 

            MudarItensDisplayDados(labelPares,SubidaOuQueda,10);
            MudarCorFundo(labelPares,SubidaOuQuedaColor,corTextoPares);
         }         
         //coluna11
         else if(j==10)
         {
            labelPares = "label1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_D1,30);
            // verifica para orientar simbolo e cor   
            if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
            else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; } 

            MudarItensDisplayDados(labelPares,SubidaOuQueda,10);
            MudarCorFundo(labelPares,SubidaOuQuedaColor,corTextoPares);
         }         
         
      }
      
      //SEGUNDO BLOCO
      PegarDadosPares(ativo, ParesPrincipais2[i], MesesHistoricos);
      for(int k=0;k<numColunas;k++)
      {
         //coluna2
         if(k==1)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            CasasDecimais = int(SymbolInfoInteger(ParesPrincipais2[i]+SimboloFinalAtivo,SYMBOL_DIGITS));
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.PrecoBidPar,CasasDecimais),8);
         }         
         //coluna3
         else if(k==2)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarCorFundo(labelPares,ativo.OrientacaoColor,corTextoPares);
            MudarItensDisplayDados(labelPares,ativo.Orientacao,9); 
         }
         //coluna4
         else if(k==3)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            if(trocarSWAPSPREADporLUCROPONTO==true)
              {
               ValorLoteAtivo = CalculaValorLoteAtivo(ParesPrincipais2[i]+SimboloFinalAtivo,1.0)/100;
               MudarItensDisplayDados(labelPares,DoubleToString(ValorLoteAtivo,5),8);
              }
            else
              {
               PegarSwapSpread(InfoAtivo, ParesPrincipais2[i]+SimboloFinalAtivo);
               ValorSwapSpred = DoubleToString(InfoAtivo.SwapCompra,1) +"/ "+ DoubleToString(InfoAtivo.SwapVenda,1) +"/ "+ DoubleToString(InfoAtivo.SpreadAtual,0);
               MudarItensDisplayDados(labelPares,ValorSwapSpred,8);
              }
         }
         //coluna5
         else if(k==4)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            cruzamentoLinhas6x21 = CalculaCruzamento6x21(ParesPrincipais2[i]+SimboloFinalAtivo);
            MudarItensDisplayDados(labelPares, cruzamentoLinhas6x21 ,8);
            
            if(StringFind(cruzamentoLinhas6x21, "PROXIMO") >=0)
              {
               MudarCorFundoTexto(labelPares,clrPeru,corFundo,corTexto);
              }
            else
              {
               MudarCorFundoTexto(labelPares,corTexto,corFundo,corTexto);
              }           
              
            if(ativo.Orientacao=="COMPRA")
              {
               if(StringFind(cruzamentoLinhas6x21, "COMPRA") >=0)
                 {
                  MudarCorFundoTexto(labelPares,corTexto,clrLightBlue,corTexto);
                 }               
              }
            else if(ativo.Orientacao=="VENDA")
              {
               if(StringFind(cruzamentoLinhas6x21, "VENDA") >=0)
                 {
                  MudarCorFundoTexto(labelPares,corTexto,clrLightPink,corTexto);
                 }               
              } 
         }  
         //coluna6
         else if(k==5)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.DistMediana,0)+"("+DoubleToString(ativo.PorcentDistanciaMediana,0)+"%)",8); 
         }  
         //coluna7
         else if(k==6)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.MovMedia,0),9); 
         }
         //coluna8
         else if(k==7)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            
            ativo.MovAgora = ativo.MovAgora<0 ? ativo.MovAgora*-1 : ativo.MovAgora;
            ativo.PorcentMov = ativo.PorcentMov<0 ? ativo.PorcentMov*-1 : ativo.PorcentMov;
            MudarItensDisplayDados(labelPares,DoubleToString(ativo.MovAgora,0)+"("+DoubleToString(ativo.PorcentMov,0)+")%",8);
         }
         //coluna9
         else if(k==8)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_D1,1);
            // verifica para orientar simbolo e cor   
            if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
            else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; }
               
            MudarItensDisplayDados(labelPares,SubidaOuQueda,10);
            MudarCorFundo(labelPares,SubidaOuQuedaColor,corTextoPares);
         }
         //coluna10
         else if(k==9)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_D1,7);
            // verifica para orientar simbolo e cor   
            if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
            else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; } 

            MudarItensDisplayDados(labelPares,SubidaOuQueda,10);
            MudarCorFundo(labelPares,SubidaOuQuedaColor,corTextoPares);
         }         
         //coluna11
         else if(k==10)
         {
            labelPares = "label2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_D1,30);
            // verifica para orientar simbolo e cor   
            if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
            else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; } 

            MudarItensDisplayDados(labelPares,SubidaOuQueda,10);
            MudarCorFundo(labelPares,SubidaOuQuedaColor,corTextoPares);
         }
      }
  
   }

   ChartRedraw();
   return(true);
}


bool CriarDisplayCustom()
{
   int numColunas = 11;
   int altura = 21;
   int largura = 60;
   int larguraAumento = 44;
   int x,y;
   int xPadding = 0;
   int yPadding = 52;
   color corFundo = clrSnow;
   color corTexto = clrDarkSlateGray;
   string objName;   
   int label1Espacamento = AfastarPaineisAEsquerda == true ? DisplayLarguraBackgroud+1 : 0; //verifica se a opcao esta habilitada pra afastar

   // verifica se tem ativos inseridos nas configurações
   if(CustomParesNames!="")
     {
      string to_split = CustomParesNames;
      string separador = ",";
      ushort u_sep = StringGetCharacter(separador,0);
      string AtivosCustom[];
      //--- Split as strings para substrings 
      int QtdAtivos = StringSplit(to_split,u_sep,AtivosCustom); 
      
      // CRIAR COLUNAS E LINHAS
      int labelEspacamento = 0;
      int label2Espacamento = (numColunas*largura)-largura/1.2+label1Espacamento+larguraAumento*2.5;
      int DistanciaEntreBlocos = 0;
      string blocoAtivos;

   
      // DADOS DINAMICOS
      DadosAtivo ativo;
      SwapSpread InfoAtivo;
      string labelPares;
      double ValorLoteAtivo;
      string ValorSwapSpred;
      string cruzamentoLinhas6x21;
      string SubidaOuQueda;
      color SubidaOuQuedaColor;
      double SubidaOuQuedaPeriodo;
      int CasasDecimais;
      int NLinhaAtivo = 0;
      int NLinhaBloco1 = 0;
      int NLinhaBloco2 = 0;
      
      // PEGO OS ATIVOS CUSTOM
      for(int i=0;i<QtdAtivos;i++)
         {         
         StringToUpper(AtivosCustom[i]);  // coloco todas em UpperCase 

            for(int j=0;j<numColunas;j++)
              {
               // PRIMEIRO BLOCO COMPRA
               if(i < 15) {NLinhaAtivo = NLinhaBloco1; labelEspacamento = label1Espacamento; blocoAtivos = "labelParesCustom1";}
               else if(i > 14 && i < 25) {NLinhaAtivo = NLinhaBloco2; labelEspacamento = label2Espacamento; blocoAtivos = "labelParesCustom2";DistanciaEntreBlocos = 5;}
               
                  objName = blocoAtivos + "_c"+IntegerToString(j)+"_l"+IntegerToString(NLinhaAtivo+1);
                  x = xPadding + j*largura;
                  y = yPadding + (NLinhaAtivo+1)*altura;
         
                  CreateLabel(objName,x,y,largura,altura,labelEspacamento+DistanciaEntreBlocos,corFundo,corTexto);
                  PegarDadosPares(ativo, AtivosCustom[i], MesesHistoricos);
                           
                  //coluna1
                  if(j==0)
                  {
                      // ATIVO
                     MudarItensDisplayPares(objName,AtivosCustom[i],10,clrOldLace,clrDarkSlateGray);  
                  }
                  //coluna2
                  else if(j==1)
                  {
                      // PREÇO                      
                     CasasDecimais = int(SymbolInfoInteger(AtivosCustom[i]+SimboloFinalAtivo,SYMBOL_DIGITS));
                     MudarItensDisplayDados(objName,DoubleToString(ativo.PrecoBidPar,CasasDecimais),8);
                  }
                  //coluna3
                  else if(j==2)
                  {
                      // AÇÃO
                     MudarCorFundo(objName,ativo.OrientacaoColor,corFundo);
                     MudarItensDisplayDados(objName,ativo.Orientacao,9);
                  }
                  //coluna4
                  else if(j==3)
                  {
                      // SWAP SPREAD OU LUCRO PONTOS
                     if(trocarSWAPSPREADporLUCROPONTO==true)
                       {
                        ValorLoteAtivo = CalculaValorLoteAtivo(AtivosCustom[i]+SimboloFinalAtivo,1.0)/100;
                        MudarItensDisplayDados(objName,DoubleToString(ValorLoteAtivo,5),8);
                       }
                     else
                       {
                        PegarSwapSpread(InfoAtivo, AtivosCustom[i]+SimboloFinalAtivo);
                        ValorSwapSpred = DoubleToString(InfoAtivo.SwapCompra,1) +"/ "+ DoubleToString(InfoAtivo.SwapVenda,1) +"/ "+ DoubleToString(InfoAtivo.SpreadAtual,0);
                        MudarItensDisplayDados(objName,ValorSwapSpred,8);
                       }
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos, largura+larguraAumento, labelEspacamento);
                  }
                  //coluna5
                  else if(j==4)
                  {
                      // CRUZAMENTO 6x21
                     cruzamentoLinhas6x21 = CalculaCruzamento6x21(AtivosCustom[i]+SimboloFinalAtivo);
                     MudarItensDisplayDados(objName, cruzamentoLinhas6x21 ,8);
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos+larguraAumento, largura+larguraAumento, labelEspacamento);
                     
                     if(StringFind(cruzamentoLinhas6x21, "PROXIMO") >=0)
                       {
                        MudarCorFundoTexto(labelPares,clrPeru,corFundo,corTexto);
                       }
                     else
                       {
                        MudarCorFundoTexto(labelPares,corTexto,corFundo,corTexto);
                       }           
                       
                     if(ativo.Orientacao=="COMPRA")
                       {
                        if(StringFind(cruzamentoLinhas6x21, "COMPRA") >=0)
                          {
                           MudarCorFundoTexto(labelPares,corTexto,clrLightBlue,corTexto);
                          }               
                       }
                     else if(ativo.Orientacao=="VENDA")
                       {
                        if(StringFind(cruzamentoLinhas6x21, "VENDA") >=0)
                          {
                           MudarCorFundoTexto(labelPares,corTexto,clrLightPink,corTexto);
                          }               
                       } 
                  }   
                  //coluna6
                  else if(j==5)
                  {
                      // MEDIANA
                     MudarItensDisplayDados(objName,DoubleToString(ativo.DistMediana,0)+"("+DoubleToString(ativo.PorcentDistanciaMediana,0)+"%)",8);
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos+larguraAumento*2, largura+larguraAumento, labelEspacamento);
                  }   
                  //coluna7
                  else if(j==6)
                  {
                      // MEDIA
                     MudarItensDisplayDados(objName,DoubleToString(ativo.MovMedia,0),8);
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos+larguraAumento*3, largura, labelEspacamento);
                  }
                  //coluna8
                  else if(j==7)
                  {
                      // MOV                  
                     ativo.MovAgora = ativo.MovAgora<0 ? ativo.MovAgora*-1 : ativo.MovAgora;
                     ativo.PorcentMov = ativo.PorcentMov<0 ? ativo.PorcentMov*-1 : ativo.PorcentMov;
                     MudarItensDisplayDados(objName,DoubleToString(ativo.MovAgora,0)+"("+DoubleToString(ativo.PorcentMov,0)+")%",8);
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos+larguraAumento*3, largura+larguraAumento/2, labelEspacamento);                     
                  }
                  //coluna9
                  else if(j==8)
                  {
                     // ▲/▼
                     SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(AtivosCustom[i]+SimboloFinalAtivo,PERIOD_D1,1);
                     // verifica para orientar simbolo e cor   
                     if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
                     else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; }
                        
                     MudarItensDisplayDados(objName,SubidaOuQueda,10);                     
                     MudarCorFundo(objName,SubidaOuQuedaColor,corFundo);
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos+larguraAumento*3+larguraAumento/2, largura-larguraAumento/1.5, labelEspacamento);
                  }
                  //coluna10
                  else if(j==9)
                  {
                     SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(AtivosCustom[i]+SimboloFinalAtivo,PERIOD_D1,7);
                     // verifica para orientar simbolo e cor   
                     if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
                     else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; } 
         
                     MudarItensDisplayDados(objName,SubidaOuQueda,10);
                     MudarCorFundo(objName,SubidaOuQuedaColor,corFundo);
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos+larguraAumento*2.8, largura-larguraAumento/1.5, labelEspacamento);
                  }         
                  //coluna11
                  else if(j==10)
                  {
                     SubidaOuQuedaPeriodo = ativo.PrecoBidPar - iClose(AtivosCustom[i]+SimboloFinalAtivo,PERIOD_D1,30);
                     // verifica para orientar simbolo e cor   
                     if(SubidaOuQuedaPeriodo<0){ SubidaOuQueda = "▼"; SubidaOuQuedaColor = clrCrimson; }
                     else if(SubidaOuQuedaPeriodo>0){ SubidaOuQueda = "▲"; SubidaOuQuedaColor = clrGreen; } 
         
                     MudarItensDisplayDados(objName,SubidaOuQueda,10);
                     MudarCorFundo(objName,SubidaOuQuedaColor,corFundo);
                     MudarLaguraLabel(objName, x+DistanciaEntreBlocos+larguraAumento*2.1, largura-larguraAumento/1.5, labelEspacamento);
                  }
   
            }
               if(i > 0 && i < 15) NLinhaBloco1 += 1;          
               
               if(i > 14 && i < 25) NLinhaBloco2 += 1;        
         } // loop linha
   
      // INSERINDO TITULO
      string labelTitulo;  
      string tituloPares[11] = {"ATIVO","PREÇO","AÇÃO","Comp/Vend/Spre","Cruzamento 6x21","MEDIANA","MEDIA","MOV","D1","W1","MN1"};
      string nomeTimeFrameEncurtado = paresTimeFrame == "SEMANA" ? StringSubstr(paresTimeFrame,0,StringLen(paresTimeFrame)-2) : paresTimeFrame;
      tituloPares[3] = trocarSWAPSPREADporLUCROPONTO==true ? "L.Ponto1.0" : "Comp/Vend/Spre";
      tituloPares[6] = "MED."+nomeTimeFrameEncurtado;
      tituloPares[7] = "MOV."+nomeTimeFrameEncurtado;
      
      color corFundoTitulo = clrDarkSlateGray;
      color corTextoTitulo = clrSnow;

      for(int j=0;j<numColunas;j++)
      {
         x = xPadding + j*largura;
         y = yPadding;
         if(NLinhaBloco1 > 0)
           {
            labelTitulo = "labelParesCustom1_c"+IntegerToString(j)+"_l0";
            CreateLabel(labelTitulo,x,y,largura,altura,label1Espacamento,corFundoTitulo,corTextoTitulo);
            MudarTituloDisplayPares(labelTitulo,tituloPares[j],corFundoTitulo,corTextoTitulo);
            if(j==3) MudarLaguraLabel(labelTitulo, x, largura+larguraAumento, label1Espacamento);
            else if(j==4) MudarLaguraLabel(labelTitulo, x+larguraAumento, largura+larguraAumento, label1Espacamento);
            else if(j==5) MudarLaguraLabel(labelTitulo, x+larguraAumento*2, largura+larguraAumento, label1Espacamento);
            else if(j==6) MudarLaguraLabel(labelTitulo, x+larguraAumento*3, largura, label1Espacamento);
            else if(j==7) MudarLaguraLabel(labelTitulo, x+larguraAumento*3, largura+larguraAumento/2, label1Espacamento);
            else if(j==8) MudarLaguraLabel(labelTitulo, x+larguraAumento*3+larguraAumento/2, largura-larguraAumento/1.5, label1Espacamento);
            else if(j==9) MudarLaguraLabel(labelTitulo, x+larguraAumento*2.8, largura-larguraAumento/1.5, label1Espacamento);
            else if(j==10) MudarLaguraLabel(labelTitulo, x+larguraAumento*2.1, largura-larguraAumento/1.5, label1Espacamento);
            else MudarLaguraLabel(labelTitulo, x, largura, label1Espacamento);
           }
         
         if(NLinhaBloco2 > 0)
           {
            labelTitulo = "labelParesCustom2_c"+IntegerToString(j)+"_l0";
            CreateLabel(labelTitulo,x,y,largura,altura,label2Espacamento,corFundoTitulo,corTextoTitulo);
            MudarTituloDisplayPares(labelTitulo,tituloPares[j],corFundoTitulo,corTextoTitulo);
            DistanciaEntreBlocos = 5;
            if(j==3) MudarLaguraLabel(labelTitulo, x, largura+larguraAumento, label2Espacamento+DistanciaEntreBlocos);
            else if(j==4) MudarLaguraLabel(labelTitulo, x+larguraAumento, largura+larguraAumento, label2Espacamento+DistanciaEntreBlocos);
            else if(j==5) MudarLaguraLabel(labelTitulo, x+larguraAumento*2, largura+larguraAumento, label2Espacamento+DistanciaEntreBlocos);
            else if(j==6) MudarLaguraLabel(labelTitulo, x+larguraAumento*3, largura, label2Espacamento+DistanciaEntreBlocos);
            else if(j==7) MudarLaguraLabel(labelTitulo, x+larguraAumento*3, largura+larguraAumento/2, label2Espacamento+DistanciaEntreBlocos);
            else if(j==8) MudarLaguraLabel(labelTitulo, x+larguraAumento*3+larguraAumento/2, largura-larguraAumento/1.5, label2Espacamento+DistanciaEntreBlocos);
            else if(j==9) MudarLaguraLabel(labelTitulo, x+larguraAumento*2.8, largura-larguraAumento/1.5, label2Espacamento+DistanciaEntreBlocos);
            else if(j==10) MudarLaguraLabel(labelTitulo, x+larguraAumento*2.1, largura-larguraAumento/1.5, label2Espacamento+DistanciaEntreBlocos); 
            else MudarLaguraLabel(labelTitulo, x, largura, label2Espacamento+DistanciaEntreBlocos); 
           }
      }
      
      // // BOTOES PARA MODIFICAR O TIMEFRAME DO CALCULO DOS PARES
      string ArrayTimeFrames[3] = {"DIA","SEMANA","MÊS"};
      int espacamentoTimeFrame;
      for(int i=0;i<ArraySize(ArrayTimeFrames);i++)
      {      
         objName = "labelParesCustomTimeFrame_"+IntegerToString(i);
         x = 70;
         y = 31;
         largura = 65;
         altura = 21;
         if(i == 0) espacamentoTimeFrame = label1Espacamento;
         else if(i == 1) espacamentoTimeFrame = label1Espacamento + largura;
         else if(i == 2) espacamentoTimeFrame = label1Espacamento + largura*2;
   
         CreateLabelTimeFrame(objName,x,y,largura,altura,espacamentoTimeFrame,ArrayTimeFrames[i]);
         if(ArrayTimeFrames[i] == paresTimeFrame)
           {
            ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,C'115, 115, 115');
            ObjectSetInteger(0,objName,OBJPROP_COLOR,clrSnow);            
           }    
      }
      
      // Destaca a cor dos dos pares operados no momento
      string ArrayPares[];
      ArrayParesOperados(ArrayPares);
      for(int i=0;i<ArraySize(ArrayPares);i++)
      {
         for(int j=1;j<=14;j++)
         {
            string objectNameParesC1 = "labelParesCustom1_c0_l"+IntegerToString(j);
            string objectNameParesC2 = "labelParesCustom2_c0_l"+IntegerToString(j);    
         
            if(ArrayPares[i] == ObjectGetString(0, objectNameParesC1, OBJPROP_TEXT))
            {
               MudarCorFundo(objectNameParesC1,clrGold,clrBlack);
            }
            else if(ArrayPares[i] == ObjectGetString(0, objectNameParesC2, OBJPROP_TEXT))
            {
               MudarCorFundo(objectNameParesC2,clrGold,clrBlack);
            }
         }
      } 
         
}
// se nao tiver pares selecionados   
else
  {
   objName = "labelParesCustom1_c0_l0";
   CreateLabel(objName,10,60,largura*10,altura*5,label1Espacamento,corFundo,corTexto);
   MudarItensDisplayPares(objName,"INSIRA OS ATIVOS DESEJADOS NAS CONFIGURAÇÕES DO PAINEL EDITÁVEL",10,corFundo,corTexto);
  }
   
   ChartRedraw();

return(true);
}


struct DadosAtivo {
   double Mediana;
   double DistMediana;
   double PrecoBidPar;
   double MovAgora;
   double MovMedia;
   double PorcentMov;
   double PorcentDistanciaMediana;
   string Orientacao;
   color OrientacaoColor;
};


struct SwapSpread {
   double SwapVenda;
   double SwapCompra;
   int SpreadAtual;
};


SwapSpread PegarSwapSpread(SwapSpread &ativo, string Par)
{
   ativo.SwapVenda = SymbolInfoDouble(Par,SYMBOL_SWAP_SHORT);
   ativo.SwapCompra = SymbolInfoDouble(Par,SYMBOL_SWAP_LONG);
   ativo.SpreadAtual = SymbolInfoInteger(Par,SYMBOL_SPREAD);

   return(ativo);
}


DadosAtivo PegarDadosPares(DadosAtivo &ativo, string Par, int Meses)
{           
   double MedianaPares;
   double ArrayPrecosPares[];
   string ParName = Par+SimboloFinalAtivo;
   ArrayResize(ArrayPrecosPares,Meses);
  
   // Considerar Pandemia para calcular Array com os preços dos ultimos anos
   if(PularPandemiaTopoFundo==true)
   {
      int MesPular1=iBarShift(ParName,PERIOD_MN1,D'2020.03.01 00:00');
      int MesPular2=iBarShift(ParName,PERIOD_MN1,D'2020.04.01 00:00');
      
      for(int i=0;i<Meses;i++)
      {
      if(i == MesPular1)
        {
         ArrayPrecosPares[i] = iClose(ParName,PERIOD_MN1,i+1);
        }
      else if(i == MesPular2)
        {
         ArrayPrecosPares[i] = iClose(ParName,PERIOD_MN1,i-1);
        }
      else
        {
         ArrayPrecosPares[i] = iClose(ParName,PERIOD_MN1,i);
        }  
      }
   }
   else
     {
     // Array com os preços dos ultimos anos
     for(int i=0;i<Meses;i++)
       {
        ArrayPrecosPares[i] = iClose(ParName,PERIOD_MN1,i);
       }   
     }

   int MenorCandlePares = ArrayMinimum(ArrayPrecosPares,0,Meses);
   int MaiorCandlePares = ArrayMaximum(ArrayPrecosPares,0,Meses);
     
   MedianaPares = (ArrayPrecosPares[MaiorCandlePares] + ArrayPrecosPares[MenorCandlePares]) / 2;
   
   ativo.PrecoBidPar = SymbolInfoDouble(ParName,SYMBOL_BID);
   ativo.DistMediana = ativo.PrecoBidPar - MedianaPares;
   
   double pontosPar = 0.0;
   // calcula a quantidade de pontos totais no perído selecionado
   for(int i=1;i<=DiasMovMedia;i++)
     {
      pontosPar += iHigh(ParName,PERIOD_D1,i)-iLow(ParName,PERIOD_D1,i);
     }  
   
   // timeframe DIA
   if(paresTimeFrame=="DIA")
     {
         ativo.MovAgora = ativo.PrecoBidPar - iClose(ParName,PERIOD_D1,1); // Fechamento Dia Anterior     
         
         // se nao for carregado e ficar com valor zero
         ativo.MovMedia = pontosPar/DiasMovMedia;
         ativo.PorcentMov = ativo.MovMedia !=0 ? (ativo.MovAgora/ativo.MovMedia)*100 : 0.0;          
     }
   // timeframe SEMANA e MÊS
   else
     {
         int diasSomar;
         ativo.MovAgora = 0.0;
         
         if(paresTimeFrame=="SEMANA")
           {
            //diasSomar = iBarShift(ParName,PERIOD_D1,iTime(NULL,PERIOD_W1,0)) + 1; // barra do ultimo dia da semana anterior
            diasSomar = 7;
           }
         else if(paresTimeFrame=="MÊS")
           {
            //diasSomar = iBarShift(ParName,PERIOD_D1,iTime(NULL,PERIOD_MN1,0)) + 1; // barra do ultimo dia do mês anterior
            diasSomar = 30;
           }                  
 
         for(int i=0;i<diasSomar;i++)
           {
            ativo.MovAgora += iHigh(ParName,PERIOD_D1,i)-iLow(ParName,PERIOD_D1,i); // pontos desde inicio
           }           
         ativo.MovMedia = pontosPar/(DiasMovMedia/diasSomar); // divide pelo período em dias
         // se nao for carregado e ficar com valor zero
         ativo.PorcentMov = ativo.MovMedia !=0 ? (ativo.MovAgora/ativo.MovMedia)*100 : 0.0;    
         // Movimentação do ativo referente ao período Anterior    
     }
  

   //Se a moeda operada for JPY 
   int MultiplicadorPontos;      
   // se for JPY
   double OrientacaoPontos;
   if(StringFind(ParName, "JPY") >=0 || StringFind(ParName, "XAU")>=0 || StringFind(ParName, "XAG") >= 0)
     {
      MultiplicadorPontos = 1000;
      OrientacaoPontos = 100;
     }
   else if(StringFind(ParName, "GER30")>=0 || StringFind(ParName, "US30")>=0 || StringFind(ParName, "US500") >= 0 || StringFind(ParName, "UK100")>=0)
     {
      MultiplicadorPontos = 100;
      OrientacaoPontos = 1000;
     }
    else
      {
       MultiplicadorPontos = 100000;
       OrientacaoPontos = 1;
      }
         
   // ORIENTACAO      
   double PontosDistanciaMediana = PontosAteMediana*0.00001;
   double MargemAteOndeOperarPares;
   if(ativo.PrecoBidPar>MedianaPares)  
     {
      MargemAteOndeOperarPares = MedianaPares + PontosDistanciaMediana*OrientacaoPontos;
         if(ativo.PrecoBidPar>MargemAteOndeOperarPares)
         {
            ativo.Orientacao="VENDA";          
            ativo.OrientacaoColor = clrCrimson;
         }
         else if(ativo.PrecoBidPar<MargemAteOndeOperarPares)
         {   
            ativo.Orientacao="NEUTRO";
            ativo.OrientacaoColor = clrBlack;
         } 
     }
   else if(ativo.PrecoBidPar<MedianaPares)
     {
      MargemAteOndeOperarPares = MedianaPares - PontosDistanciaMediana*OrientacaoPontos;
      if(ativo.PrecoBidPar<MargemAteOndeOperarPares)
      {
         ativo.Orientacao="COMPRA";        
         ativo.OrientacaoColor = clrMediumBlue;
      }
      else if(ativo.PrecoBidPar>MargemAteOndeOperarPares)
      {   
         ativo.Orientacao="NEUTRO";
         ativo.OrientacaoColor = clrBlack;
      }     
     }   

     
   ativo.Mediana = MedianaPares;
   ativo.DistMediana = ativo.DistMediana*MultiplicadorPontos;
   ativo.MovAgora = ativo.MovAgora*MultiplicadorPontos;
   ativo.MovMedia = ativo.MovMedia*MultiplicadorPontos;
   
   double ReferenciaMediana = ativo.PrecoBidPar>MedianaPares ? (ArrayPrecosPares[MaiorCandlePares] - MedianaPares)*MultiplicadorPontos : (ArrayPrecosPares[MenorCandlePares] - MedianaPares)*MultiplicadorPontos;
   ativo.PorcentDistanciaMediana = ReferenciaMediana!=0 ? ((ativo.DistMediana)/ReferenciaMediana)*100 : 0;
      
   return(ativo);
}


bool CriarDisplayPrecos()
{
   int numLinhas = 15;
   int numColunas = 8;
   int altura = 21;
   int largura = 44;
   
   // CRIAR COLUNAS E LINHAS
   int label1Espacamento = AfastarPaineisAEsquerda == true ? DisplayLarguraBackgroud+1 : 0; //verifica se a opcao esta habilitada pra afastar
   int label2Espacamento = (numColunas*largura)+label1Espacamento;
   string objName;
   int x,y;
   int xPadding = 0;
   int yPadding = 27;
   color corFundo = C'255, 242, 230';
   color corTexto = clrBlack;
   color corBorda = clrSlateGray;
   
   // localizacao canto direito superior
   if(LocalizacaoDisplay == 4)
   {
      //xPadding = -45;
   }
   // tamanho maior do display
   if(TamanhoDisplay == 2)
   {
      xPadding = 30;
      if(LocalizacaoDisplay == 4)
      {
         xPadding = -75;
      } 
   }
   
   for(int i=0;i<numLinhas;i++)
   {  
      //PRIMEIRO BLOCO
      for(int j=0;j<numColunas;j++)
      {
         objName = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i);
         x = xPadding + j*largura;
         y = yPadding + i*altura;
         CreateLabelPreco(objName,x,y,largura,altura,label1Espacamento,corFundo,corTexto,corBorda);       
      }
      //SEGUNDO BLOCO
      for(int k=0;k<numColunas;k++)
      {
         objName = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i);
         x = xPadding + 1 + k*largura;
         y = yPadding + i*altura;
         CreateLabelPreco(objName,x,y,largura,altura,label2Espacamento,corFundo,corTexto,corBorda);        
      }
   }
   
   // INSERINDO TITULO
   string labelTitulo;
   string tituloPares[8] = {"ATIVO","PREÇO","HOJE","ONTEM","SEMANA","NO MES"};
   string UltimosAnos = IntegerToString(MesesHistoricos/12)+" ANOS";
   tituloPares[6] = Tempo.year;
   tituloPares[7] = UltimosAnos;
   for(int i=1;i<numColunas;i++)
     {
      for(int j=0;j<numColunas;j++)
        {
         labelTitulo = "labelPrecos"+IntegerToString(i)+"_c"+IntegerToString(j)+"_l0";
         MudarTituloDisplayPares(labelTitulo,tituloPares[j],corFundo,corTexto);
         MudarCorFundoTexto(labelTitulo,corTexto,clrGainsboro,corBorda);
        }
     } 

   InsereParesPrecos();            
   ChartRedraw();
   return(true);
}


bool InsereParesPrecos()
{   
   // INSERINDO PARES NAS COLUNAS
   DadosAtivo ativo;
   string labelPares;
   color corFundoNegativoPares = clrCrimson;
   color corFundoPositivoPares = C'0, 153, 51';
   color corFundo = C'36,46,65';
   color corFundoAtivo = C'36,46,65';
   color corTexto = clrBlack;
   color corTextoAtivo = clrSnow;
   color corTextoPreco = clrSnow;
   color corBorda = C'36,46,65';
   color corTextoResultado;
   color corTextoOrientacao = clrSnow;
   int CasasDecimais;
   double PrecoHoje;
   double PrecoPeriodoAtual;
   double PrecoPeriodoAnterior;
   double PorcentagemPreco;
   int BarInicioAno;

   //PRIMEIRO BLOCO
   for(int i=0;i<14;i++)
   {
      for(int j=0;j<8;j++)
      {
         //coluna1
         if(j<1)
         {
            // ATIVO
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            MudarItensDisplayDados(labelPares,ParesPrincipais1[i],8);
            MudarCorFundoTexto(labelPares,corTextoAtivo,corFundoAtivo,corFundoAtivo);              
         }
         //coluna2
         else if(j<2)
         {
            // Preco HOJE
            PrecoHoje = SymbolInfoDouble(ParesPrincipais1[i]+SimboloFinalAtivo,SYMBOL_BID);
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            CasasDecimais = int(SymbolInfoInteger(ParesPrincipais1[i]+SimboloFinalAtivo,SYMBOL_DIGITS));
            MudarItensDisplayDados(labelPares,DoubleToString(PrecoHoje,CasasDecimais),8);
            MudarCorFundoTexto(labelPares,corTextoPreco,corFundo,corBorda);
         }
         //coluna3
         else if(j<3)
         {
            // Porcentagem Preco HOJE
            PrecoPeriodoAtual = SymbolInfoDouble(ParesPrincipais1[i]+SimboloFinalAtivo,SYMBOL_BID);
            PrecoPeriodoAnterior = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_D1,1);
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna4
         else if(j<4)
         {
            // Porcentagem Preco ONTEM
            PrecoPeriodoAtual = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_D1,1);
            PrecoPeriodoAnterior = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_D1,2);
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna5
         else if(j<5)
         {
            // Porcentagem Preco SEMANA
            PrecoPeriodoAtual = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_W1,0);
            PrecoPeriodoAnterior = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_W1,1);
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna6
         else if(j<6)
         {
            // Porcentagem Preco 1 MES
            PrecoPeriodoAtual = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_MN1,0);
            PrecoPeriodoAnterior = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_MN1,1);
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }  
         //coluna7
         else if(j<7)
         {
            // Porcentagem Preco NESSE ANO
            PrecoPeriodoAtual = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_MN1,0);
            BarInicioAno = iBarShift(_Symbol,PERIOD_MN1,StringToTime("01.01."+IntegerToString(Tempo.year)))+1; //fechamento do ultimo dia do periodo anterior
            PrecoPeriodoAnterior = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_MN1,BarInicioAno);
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna8
         else if(j<8)
         {
            // Media de Preco dos ultimos Anos
            PrecoPeriodoAtual = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_MN1,0);
            PrecoPeriodoAnterior = iClose(ParesPrincipais1[i]+SimboloFinalAtivo,PERIOD_MN1,MesesHistoricos);
            labelPares = "labelPrecos1_c"+IntegerToString(j)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
      }
      //SEGUNDO BLOCO
      for(int k=0;k<8;k++)
      {
         //coluna1
         if(k<1)
         {
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            MudarItensDisplayDados(labelPares,ParesPrincipais2[i],8);
            MudarCorFundoTexto(labelPares,corTextoAtivo,corFundoAtivo,corFundoAtivo); 
         }
         //coluna2
         else if(k<2)
         {
            // Preco HOJE
            PrecoHoje = SymbolInfoDouble(ParesPrincipais2[i]+SimboloFinalAtivo,SYMBOL_BID);
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            CasasDecimais = int(SymbolInfoInteger(ParesPrincipais2[i]+SimboloFinalAtivo,SYMBOL_DIGITS));
            MudarItensDisplayDados(labelPares,DoubleToString(PrecoHoje,CasasDecimais),8);
            MudarCorFundoTexto(labelPares,corTextoPreco,corFundo,corBorda);
         }
         //coluna3
         else if(k<3)
         {
            // Porcentagem Preco HOJE
            PrecoPeriodoAtual = SymbolInfoDouble(ParesPrincipais2[i]+SimboloFinalAtivo,SYMBOL_BID);
            PrecoPeriodoAnterior = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_D1,1);
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }     
         //coluna4
         else if(k<4)
         {
            // Porcentagem Preco ONTEM
            PrecoPeriodoAtual = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_D1,1);
            PrecoPeriodoAnterior = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_D1,2);
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna5
         else if(k<5)
         {
            // Porcentagem Preco SEMANA
            PrecoPeriodoAtual = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_W1,0);
            PrecoPeriodoAnterior = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_W1,1);
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna6
         else if(k<6)
         {
            // Porcentagem Preco 1 MES
            PrecoPeriodoAtual = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_MN1,0);
            PrecoPeriodoAnterior = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_MN1,1);
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna7
         else if(k<7)
         {
            // Porcentagem Preco NESSE ANO
            PrecoPeriodoAtual = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_MN1,0);
            BarInicioAno = iBarShift(_Symbol,PERIOD_MN1,StringToTime("01.01."+IntegerToString(Tempo.year))) + 1; //fechamento do ultimo dia do periodo anterior
            PrecoPeriodoAnterior = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_MN1,BarInicioAno);
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
         //coluna8
         else if(k<8)
         {
            // Media de Preco dos ultimos Anos
            PrecoPeriodoAtual = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_MN1,0);
            PrecoPeriodoAnterior = iClose(ParesPrincipais2[i]+SimboloFinalAtivo,PERIOD_MN1,MesesHistoricos);
            labelPares = "labelPrecos2_c"+IntegerToString(k)+"_l"+IntegerToString(i+1);
            PorcentagemPreco = PrecoPeriodoAnterior != 0? ((PrecoPeriodoAtual-PrecoPeriodoAnterior)/PrecoPeriodoAnterior)*100 : 0;
            MudarItensDisplayDados(labelPares,DoubleToString(PorcentagemPreco,2)+"%",8);
            corTextoResultado = PorcentagemPreco >= 0 ? corFundoPositivoPares : corFundoNegativoPares;
            MudarCorFundoTexto(labelPares,corTextoResultado,corFundo,corBorda);
         }
      }

   }

   ChartRedraw();
   return(true);
}


bool CriarDisplayForcaMoeda()
{
   int numLinhas = 9;
   int numColunas = 10;
   int altura = 21;
   int largura = 40;
   
   // CRIAR COLUNAS E LINHAS
   int label1Espacamento = 0;
   string objName;
   int x,y;
   int xPadding = DisplayLarguraBackgroud;
   int yPadding = AbaixarPainelForca!=false ? DisplayAlturaBackgroud+40 : 27;
   color corFundo = clrSnow;
   color corTexto = clrDarkSlateGray;
   
   // INSERINDO TITULO
   string labelTitulo;
   string tituloPares[10] = {"ATIVO","FORÇA","AUD","CAD","CHF","EUR","GBP","NZD","JPY","USD"};
   
   for(int i=0;i<numLinhas;i++)
   {  
      
      for(int j=0;j<numColunas;j++)
      {
      corFundo = clrDarkSlateGray;
      corTexto = clrSnow;
      if(i==1)
        {
         labelTitulo = "labelForca_c"+IntegerToString(j)+"_l0";
         MudarTituloDisplayPares(labelTitulo,tituloPares[j],corFundo,corTexto);
        }
      else if(i==3)
        {
         labelTitulo = "labelForca_c"+IntegerToString(j)+"_l0";
         MudarTituloDisplayPares(labelTitulo,tituloPares[j],corFundo,corTexto);
        }         
         objName = "labelForca_c"+IntegerToString(j)+"_l"+IntegerToString(i);
         x = xPadding + j*largura;
         y = yPadding + i*altura;   

         CreateLabel(objName,x,y,largura,altura,label1Espacamento,corFundo,corTexto);              
      }
   }
   
   // // BOTOES PARA MODIFICAR O TIMEFRAME DO CALCULO DE FORÇA
   string ArrayTimeFrames[9] = {"M1","M5","M15","M30","H1","H4","D1","W1","MN1"};
   for(int i=0;i<9;i++)
   {        
      for(int j=0;j<1;j++)
      {        
         objName = "labelForcaTimeFrame_c0_l"+IntegerToString(i);
         x = xPadding+ (numColunas)*largura;
         y = yPadding + i*altura;   

         CreateLabelTimeFrame(objName,x,y,largura,altura,label1Espacamento,ArrayTimeFrames[i]);
         if(ArrayTimeFrames[i] == forcaTimeFrame)
           {
            ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,C'115, 115, 115');
            ObjectSetInteger(0,objName,OBJPROP_COLOR,clrSnow);            
           }            
      }
   }

   // fazer todos os calculos  
   SomaQuantidadeMoedaBase();
   ChartRedraw();
   return(true);
}


bool SomaQuantidadeMoedaBase()
{  
   string MoedaBase[8] = {"AUD","CAD","CHF","EUR","GBP","NZD","JPY","USD"};  
   double ForcaNoMomentoOrder[8][2];
   double ArrayParFrenteaoPares[8][8];
   // zerando o Array para popular novamente
   for(int i=0;i<8;i++)
   { 
      for(int q=0;q<8;q++)
      {
      ArrayParFrenteaoPares[i][q] = 0.0;
      }
   }
      
   for(int i=0;i<ArraySize(MoedaBase);i++)
    { 
      double ForcaNoMomento = 0.0;
      double ForcaFrenteAosPares = 0.0;
      double ForcaDaMoeda;

      //Chama funcao de Força no Dia
      ForcaNoMomento = CalculaForca(MoedaBase[i],false,ArrayParFrenteaoPares,i);
      
      //Chama funcao de Força do Par Frente ao demais Pares
      CalculaForca(MoedaBase[i],true,ArrayParFrenteaoPares,i);

      ForcaNoMomentoOrder[i][0] = ForcaNoMomento;
      ForcaNoMomentoOrder[i][1] = i;
    }     
   ArraySort(ForcaNoMomentoOrder);
   
   //inserir ordenado do maior pro menor
   for(int i = 8, j = 1; i > 0; i--, j ++)   
     {
      //forca hoje
      string labelForcaMomentoMoeda = "labelForca_c0_l"+IntegerToString(j);
      string labelValorForcaMomentoMoeda = MoedaBase[(int)ForcaNoMomentoOrder[i-1][1]];
      MudarItensDisplayDados(labelForcaMomentoMoeda,labelValorForcaMomentoMoeda,10);     
      string labelForcaMomento = "labelForca_c1_l"+IntegerToString(j);
      string labelValorForcaMomento = DoubleToString(ForcaNoMomentoOrder[i-1][0],1);
      MudarItensDisplayDados(labelForcaMomento,labelValorForcaMomento,8);
   
      color fundo;
      if(i == 1) fundo = clrRed;
      else if(i == 2) fundo = C'255,77,77';
      else if(i == 3) fundo = C'255, 110, 110';
      else if(i == 4) fundo = clrCoral;
      else if(i == 5) fundo = clrGold;
      else if(i == 6) fundo = C'204, 204, 0';
      else if(i == 7) fundo = clrLimeGreen;
      else if(i == 8) fundo = clrGreen;
      
      color texto = clrSnow;
      MudarCorFundo(labelForcaMomentoMoeda,fundo,texto);
      MudarCorFundo(labelForcaMomento,fundo,texto);
     }
     
   //forca cada moeda individual
   for(int i=0;i<8;i++)
     {
      string labelMoedaOrdenada = "labelForca_c0_l"+IntegerToString(i+1);
      string objectPar = ObjectGetString(0, labelMoedaOrdenada, OBJPROP_TEXT);
         
        for(int j=0;j<8;j++)
          {
           if(MoedaBase[j]==objectPar)
             {
               for(int q=0;q<8;q++)
               {
               string labelForcaFrenteMoeda = "labelForca_c"+IntegerToString(q+2)+"_l"+IntegerToString(i+1);
               string labelValorForcaFrenteMoeda = DoubleToString(ArrayParFrenteaoPares[j][q],1);
               

               color fundo;
               if(ArrayParFrenteaoPares[j][q] < 0.0) fundo = C'255, 179, 179';
               else if(ArrayParFrenteaoPares[j][q] > 0.0) fundo = C'121, 210, 121';
               else
                 {
                  fundo = clrDarkSlateGray;
                  labelValorForcaFrenteMoeda = "-";
                 }
                  
               color texto = clrDarkSlateGray;
               MudarCorFundo(labelForcaFrenteMoeda,fundo,texto);
               MudarItensDisplayDados(labelForcaFrenteMoeda,labelValorForcaFrenteMoeda,8);
               } 
             }
          }  

     }

return(true);
}


double CalculaForca(string Moeda,bool ParFrenteaoPares,double &ArrayParFrenteaoPares[][],int contador)
{

   string AUD[8] = {"", "AUDCAD", "AUDCHF", "EURAUD", "GBPAUD", "AUDNZD", "AUDJPY", "AUDUSD"};
   string CAD[8] = {"AUDCAD", "", "CADCHF", "EURCAD", "GBPCAD", "NZDCAD", "CADJPY", "USDCAD"};
   string CHF[8] = {"AUDCHF", "CADCHF", "", "EURCHF", "GBPCHF", "NZDCHF", "CHFJPY", "USDCHF"};   
   string EUR[8] = {"EURAUD", "EURCAD", "EURCHF", "", "EURGBP", "EURNZD", "EURJPY", "EURUSD"};   
   string GBP[8] = {"GBPAUD", "GBPCAD", "GBPCHF", "EURGBP", "", "GBPNZD", "GBPJPY", "GBPUSD"};
   string NZD[8] = {"AUDNZD", "NZDCAD", "NZDCHF", "EURNZD", "GBPNZD", "", "NZDJPY", "NZDUSD"};
   string JPY[8] = {"AUDJPY", "CADJPY", "CHFJPY", "EURJPY", "GBPJPY", "NZDJPY", "", "USDJPY"};
   string USD[8] = {"AUDUSD", "USDCAD", "USDCHF", "EURUSD", "GBPUSD", "NZDUSD", "USDJPY", ""};
   
   string ArrayMoeda[8];
   string Pardamoeda;
   double Range = 0.0;
   double ForcaDaMoeda = 0.0;
   double ForcaDaReal = 0.0;
   
   ENUM_TIMEFRAMES timeframe;
   int PeriodoAnteriores = 0;
   
   if(forcaTimeFrame == "M1") timeframe = PERIOD_M1;
   else if(forcaTimeFrame == "M5") {timeframe = PERIOD_M1; PeriodoAnteriores = 5;}
   else if(forcaTimeFrame == "M15") {timeframe = PERIOD_M1; PeriodoAnteriores = 15;}
   else if(forcaTimeFrame == "M30") {timeframe = PERIOD_M1; PeriodoAnteriores = 30;}
   else if(forcaTimeFrame == "H1") {timeframe = PERIOD_M1; PeriodoAnteriores = 60;}
   else if(forcaTimeFrame == "H4") {timeframe = PERIOD_M1; PeriodoAnteriores = 240;}
   else if(forcaTimeFrame == "D1") timeframe = PERIOD_D1;
   else if(forcaTimeFrame == "W1") timeframe = PERIOD_W1;
   else if(forcaTimeFrame == "MN1") timeframe = PERIOD_MN1;
      
   if(Moeda == "AUD") ArrayCopy(ArrayMoeda,AUD,0,0,WHOLE_ARRAY);
   else if(Moeda == "CAD") ArrayCopy(ArrayMoeda,CAD,0,0,WHOLE_ARRAY);
   else if(Moeda == "CHF") ArrayCopy(ArrayMoeda,CHF,0,0,WHOLE_ARRAY);
   else if(Moeda == "EUR") ArrayCopy(ArrayMoeda,EUR,0,0,WHOLE_ARRAY);
   else if(Moeda == "GBP") ArrayCopy(ArrayMoeda,GBP,0,0,WHOLE_ARRAY);
   else if(Moeda == "NZD") ArrayCopy(ArrayMoeda,NZD,0,0,WHOLE_ARRAY);
   else if(Moeda == "JPY") ArrayCopy(ArrayMoeda,JPY,0,0,WHOLE_ARRAY);
   else if(Moeda == "USD") ArrayCopy(ArrayMoeda,USD,0,0,WHOLE_ARRAY);

   for(int i=0;i<ArraySize(ArrayMoeda);i++)
   {  
      Pardamoeda = ArrayMoeda[i]+SimboloFinalAtivo;
           
      //No dia
      double Low = iLow(Pardamoeda,timeframe,PeriodoAnteriores);
      double High = iHigh(Pardamoeda,timeframe,PeriodoAnteriores);
      double Open = iOpen(Pardamoeda,timeframe,PeriodoAnteriores);
      double Close = iClose(Pardamoeda,timeframe,PeriodoAnteriores);

      Range=High-Low;     
      if(Range != 0)
      {  
         if(ArrayMoeda[i]!="")
           {
            ForcaDaMoeda = ((Close-Open)/Range)*10;
           }
         else
           {
            ForcaDaMoeda = 0.0;
           }
         
         // descobre se a moeda frente a moeda base esta mais forte
         if(StringSubstr(ArrayMoeda[i],3,3) == Moeda)
           {
              ForcaDaMoeda = ForcaDaMoeda*-1;
           }
           //Print("Moeda: ",Moeda," Par: ",ArrayMoeda[i]," Valor: ",ForcaDaMoeda," Total: ",ForcaDaReal," contador: ",contador," i: ",i);
           
        if(ParFrenteaoPares == true)
          {
            ArrayParFrenteaoPares[contador][i] = ForcaDaMoeda;
          }
         ForcaDaReal += ForcaDaMoeda;        
      }
      else
      {
         string labelForca = "labelForca_c1_l"+IntegerToString(i+1);         
         MudarItensDisplayDados(labelForca,"AGUARDE",8); 
         string labelForcaSemana = "labelForca_c3_l"+IntegerToString(i+1);         
         MudarItensDisplayDados(labelForcaSemana,"AGUARDE",8);         
      }         
   }
  if(ParFrenteaoPares == true)
    {
      return(0);
    }
   return(ForcaDaReal/7);
}



bool CriarDadosEconomicos()
{
   int numLinhas = 11;
   int numColunas = 12;
   int altura = 30;
   int largura = 90;
   int larguraNomeEvento = 170;
   int larguraMenorSetas = 30;
   
   // CRIAR COLUNAS E LINHAS
   int label1Espacamento = AfastarPaineisAEsquerda == true ? DisplayLarguraBackgroud+1 : 0; //verifica se a opcao esta habilitada pra afastar
   //int label1Espacamento = 5;
   string objName;
   int x,y;
   int xPadding = 0;
   int yPadding = 61;
   color corFundo = clrSnow;
   color corTexto = clrDarkSlateGray;

   for(int i=0;i<numLinhas;i++)
   {  
      
      for(int j=0;j<numColunas;j++)
      {
         objName = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(i);
         x = xPadding + j*largura;
         y = yPadding + i*altura;
         if(j==0)
           {
            CreateLabel(objName,x,y,largura+larguraNomeEvento,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==6)
           {
            CreateLabel(objName,x+larguraNomeEvento,y,largura-larguraMenorSetas,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==7)
           {
            CreateLabel(objName,x+larguraNomeEvento-larguraMenorSetas,y,largura,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==8)
           {
            CreateLabel(objName,x+larguraNomeEvento-larguraMenorSetas,y,largura-larguraMenorSetas,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==9)
           {
            CreateLabel(objName,x+larguraNomeEvento-larguraMenorSetas*2,y,largura,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==10)
           {
            CreateLabel(objName,x+larguraNomeEvento-larguraMenorSetas*2,y,largura-larguraMenorSetas,altura,label1Espacamento,corFundo,corTexto);
           }
         else if(j==11)
           {
            CreateLabel(objName,x+larguraNomeEvento-larguraMenorSetas*3,y,largura,altura,label1Espacamento,corFundo,corTexto);
           }
         else
           {
            CreateLabel(objName,x+larguraNomeEvento,y,largura,altura,label1Espacamento,corFundo,corTexto);
           }      
      }
   }
   
   
   // INSERINDO TITULO
   string labelTitulo;
   string tituloPares[12] = {"DADO ECONÔMICO DA MOEDA","HISTÓRICO","FREQUENCIA","DATA ATUAL","PERÍODO-BASE","PREVISÃO","▲/▼","VALOR ATUAL","▲/▼","ANTERIOR","▲/▼","ANTEANTERIOR"};
   corFundo = clrDarkSlateGray;
   corTexto = clrSnow;

      for(int j=0;j<numColunas;j++)
        {
         labelTitulo = "labelDadosEconomicos_c"+IntegerToString(j)+"_l0";
         MudarTituloDisplayPares(labelTitulo,tituloPares[j],corFundo,corTexto);
         // aumento o tamanho do primeiro titulo
         if(j==0)
         {
            MudarAlinhamento(labelTitulo, ALIGN_CENTER,12); 
         }
        }

   // // BOTOES PARA MODIFICAR A MOEDA PARA PEGAR AS NOTICIAS
   // MoedaBasePais variavel global
   string ArrayMoedas[11] = {"AUD","CAD","CHF","EUR","GBP","NZD","JPY","USD","MXN","SGD","SEK"};
   for(int i=0;i<ArraySize(ArrayMoedas);i++)
   {        
      for(int j=0;j<1;j++)
      {        
         objName = "labelDadosEconomicosMoeda_c0_l"+IntegerToString(i);
         largura = 40;
         x = 0 + i*largura;
         y = 30;
            

         CreateLabelTimeFrame(objName,x,y,largura,altura,label1Espacamento,ArrayMoedas[i]);
         MudarCorFundoTexto(objName,clrBlack,clrBeige,clrBlack);
         if(ArrayMoedas[i] == MoedaBasePais)
           {
            ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,clrGold);
            ObjectSetInteger(0,objName,OBJPROP_COLOR,clrBlack);            
           }            
      }
   }

   // Insere dados Dinâmicos
   InsereDadosEconomicos();

   
   ChartRedraw();
   return(true);
}


bool InsereDadosEconomicos()
{

   int AUD[10] = {36010019,36010020,36010006,36010015,36010014,36030008,36010011,36020002,36010012,36010003};
   int CAD[10] = {124010022,124010035,124010014,124010004,124010003,124040006,124010018,124500001,124010007,124010011};
   int CHF[10] = {756040001,756040002,756040003,756020002,756020001,756010001,756030003,756060001,756020007,756020008};
   int EUR[10] = {999030016,999030017,999030020,999030013,999030011,999010007,999030019,999500001,999030003,999030001};
   int GBP[10] = {826010037,826010038,826010003,826010012,826010011,826020009,826010030,826500001,826010019,826010046};
   int NZD[10] = {554010024,554010025,554010014,554010006,554010005,554020009,554010009,554060001,554010019,554010016};
   int JPY[10] = {392010001,392010003,392030007,392030003,392030010,392060022,392040002,392500001,392020002,392050002};
   int USD[10] = {840010007,840030015,840030007,840030005,840050014,840020001,840500001,840020010,840030016};
   int MXN[10] = {484020016,484020017,484020010,484020004,484020003,484030003,484020014,484500001,484020012};
   int SGD[10] = {702010004,702010005,702030001,702010001,702010009,702050001,702010002,};
   int SEK[10] = {752010019,752010020,752010011,752010002,752010001,752030001,752010014,752040001,752010015};
        
   if(MoedaBasePais == "AUD") ArrayCopy(NoticiasID,AUD,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "CAD") ArrayCopy(NoticiasID,CAD,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "CHF") ArrayCopy(NoticiasID,CHF,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "EUR") ArrayCopy(NoticiasID,EUR,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "GBP") ArrayCopy(NoticiasID,GBP,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "NZD") ArrayCopy(NoticiasID,NZD,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "JPY") ArrayCopy(NoticiasID,JPY,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "USD") ArrayCopy(NoticiasID,USD,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "MXN") ArrayCopy(NoticiasID,MXN,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "SGD") ArrayCopy(NoticiasID,SGD,0,0,WHOLE_ARRAY);
   else if(MoedaBasePais == "SEK") ArrayCopy(NoticiasID,SEK,0,0,WHOLE_ARRAY);
  
   for(int i=0;i<ArraySize(NoticiasID);i++)
   {
      if(NoticiasID[i] != 0)
        {
         InsereLinhasDadosEconomicos(MoedaBasePais,NoticiasID[i], i);
         Sleep(2000);
        }  
   }

   return(true);
}



bool InsereLinhasDadosEconomicos(string MoedaBasePais, int NoticiaID, int linha)
{  
   DadosEvento evento;
   // pega as informações
   PegarDadosEvento(evento,NoticiaID);
   
   string NoticiaCorrigida[10];
   
   if(MoedaBasePais=="USD")
     {
      NoticiaCorrigida[0] = "Taxa de Crescimento do PIB";
      NoticiaCorrigida[1] = "Taxa de Desemprego";   
      NoticiaCorrigida[2] = "Taxa De Inflação";
      NoticiaCorrigida[3] = "Taxa De Inflação (Mensal)";
      NoticiaCorrigida[4] = "Taxa De Juros";
      NoticiaCorrigida[5] = "Balança Comercial";
      NoticiaCorrigida[6] = "PMI Industrial";   
      NoticiaCorrigida[7] = "Vendas no Varejo";
      NoticiaCorrigida[8] = "Variação no Emprego";      
     }
   else if(MoedaBasePais=="SGD")
     {
      NoticiaCorrigida[0] = "Taxa de Crescimento do PIB";
      NoticiaCorrigida[1] = "Crescimento do PIB (Anual)";
      NoticiaCorrigida[2] = "Taxa de Desemprego";   
      NoticiaCorrigida[3] = "Taxa De Inflação";
      NoticiaCorrigida[4] = "Balança Comercial";
      NoticiaCorrigida[5] = "PMI Industrial";   
      NoticiaCorrigida[6] = "Vendas no Varejo";   
     }
   else
     {
      NoticiaCorrigida[0] = "Taxa de Crescimento do PIB";
      NoticiaCorrigida[1] = "Crescimento do PIB (Anual)";
      NoticiaCorrigida[2] = "Taxa de Desemprego";   
      NoticiaCorrigida[3] = "Taxa De Inflação";
      NoticiaCorrigida[4] = "Taxa De Inflação (Mensal)";
      NoticiaCorrigida[5] = "Taxa De Juros";
      NoticiaCorrigida[6] = "Balança Comercial";
      NoticiaCorrigida[7] = "PMI Industrial";   
      NoticiaCorrigida[8] = "Vendas no Varejo";
      NoticiaCorrigida[9] = "Variação no Emprego";      
     } 


   
   if(evento.EventoEncontrado)
     {    
      string labelPares;
      
      bool InverteInterpretacaoSubidaQueda = false;

      // Modifica os valores para apresentar
      int Decimais = 1;
      string UnidadeValor=" %";             

      if(NoticiaCorrigida[linha]=="Taxa De Juros")
        {
         Decimais = 2;
         UnidadeValor = " %";
        }
      else if(NoticiaCorrigida[linha]=="Taxa de Desemprego")
        {
         InverteInterpretacaoSubidaQueda = true;
        }
      else if(NoticiaCorrigida[linha]=="PMI Industrial")
        {
         UnidadeValor = "";
        }
      else if(NoticiaCorrigida[linha]=="Taxa De Inflação" || NoticiaCorrigida[linha]=="Taxa De Inflação (Mensal)" || NoticiaCorrigida[linha]=="Taxa De Juros")
        {
         InverteInterpretacaoSubidaQueda = true;
         Decimais = 2;
        }
      else if(NoticiaCorrigida[linha]=="Variação no Emprego")
        {       
           if(MoedaBasePais=="AUD" || MoedaBasePais=="CAD")
             {
               UnidadeValor = " mil";
               Decimais = 1;
             }
           else if(MoedaBasePais=="USD" || MoedaBasePais=="GBP")
             {
               UnidadeValor = " mil";
               Decimais = 0;
             }
           else if(MoedaBasePais=="EUR" || MoedaBasePais=="NZD")
             {
               UnidadeValor = " %";
               Decimais = 1;
             }          
           else if(MoedaBasePais=="JPY")
             {
               UnidadeValor = "";
               Decimais = 2;
             }           
           else if(MoedaBasePais=="CHF")
             {
               UnidadeValor = " milh";
               Decimais = 3;
             }    
        }     
      else if(NoticiaCorrigida[linha]=="Balança Comercial")
        {
         Decimais = 3;
         UnidadeValor = " bi";
        }

      color EventoCorPadrao = clrDarkSlateGray;
      color EventoCorQueda = clrCrimson;
      color EventoCorSubida = clrGreen;
      color CorFundoQueda = C'252, 155, 156';
      color CorFundoSubida = C'154, 235, 175';
      color CorFundoQuedaOuSubidaAtual;
      color CorFundoQuedaOuSubidaAnterior;
      color CorFundoQuedaOuSubidaAnteAnterior;
      color SubidaOuQuedaColorAtual;
      color SubidaOuQuedaColorAnterior;
      color SubidaOuQuedaColorAnteAnterior;
      
      string EventoSubida = "▲";
      string EventoQueda = "▼";
      string EventoIgual = "=";
      
      string SubidaOuQuedaAtual;
      string SubidaOuQuedaAnterior;
      string SubidaOuQuedaAnteAnterior;
      string SubidaOuQuedaProjecao;

      if(evento.DadoAtual > evento.DadoAnterior){SubidaOuQuedaAtual = EventoSubida; SubidaOuQuedaColorAtual = EventoCorSubida; CorFundoQuedaOuSubidaAtual = CorFundoSubida;}
      else if(evento.DadoAtual < evento.DadoAnterior){SubidaOuQuedaAtual = EventoQueda; SubidaOuQuedaColorAtual = EventoCorQueda; CorFundoQuedaOuSubidaAtual = CorFundoQueda;}
      else if(evento.DadoAtual == evento.DadoAnterior){SubidaOuQuedaAtual = EventoIgual; SubidaOuQuedaColorAtual = EventoCorPadrao; CorFundoQuedaOuSubidaAtual = clrSnow;}     
      
      if(evento.DadoAnterior > evento.DadoAnteAnterior){SubidaOuQuedaAnterior = EventoSubida; SubidaOuQuedaColorAnterior = EventoCorSubida; CorFundoQuedaOuSubidaAnterior = CorFundoSubida;}
      else if(evento.DadoAnterior < evento.DadoAnteAnterior){SubidaOuQuedaAnterior = EventoQueda; SubidaOuQuedaColorAnterior = EventoCorQueda; CorFundoQuedaOuSubidaAnterior = CorFundoQueda;}
      else if(evento.DadoAnterior == evento.DadoAnteAnterior){SubidaOuQuedaAnterior = EventoIgual; SubidaOuQuedaColorAnterior = EventoCorPadrao; CorFundoQuedaOuSubidaAnterior = clrSnow;}   
      
      if(evento.DadoAnteAnterior > evento.DadoMaisAntigo){SubidaOuQuedaAnteAnterior = EventoSubida; SubidaOuQuedaColorAnteAnterior = EventoCorSubida; CorFundoQuedaOuSubidaAnteAnterior = CorFundoSubida;}
      else if(evento.DadoAnteAnterior < evento.DadoMaisAntigo){SubidaOuQuedaAnteAnterior = EventoQueda; SubidaOuQuedaColorAnteAnterior = EventoCorQueda; CorFundoQuedaOuSubidaAnteAnterior = CorFundoQueda;}
      else if(evento.DadoAnteAnterior == evento.DadoMaisAntigo){SubidaOuQuedaAnteAnterior = EventoIgual; SubidaOuQuedaColorAnteAnterior = EventoCorPadrao; CorFundoQuedaOuSubidaAnteAnterior = clrSnow;}  
      
      // CASO A PROJECAO AINDA NAO TENHA SAÍDO
      double ValorProjecao;
      string UnidadeValorProjecao = UnidadeValor;
      if(evento.DadoProjecao == -9.223372036854776e+18)
        {
         ValorProjecao = "-";
         UnidadeValorProjecao = "";
        }
      else
        {
         ValorProjecao = evento.DadoProjecao;
        }
        
      if(ValorProjecao > evento.DadoAtual){SubidaOuQuedaProjecao = EventoSubida;}
      else if(ValorProjecao < evento.DadoAtual){SubidaOuQuedaProjecao = EventoQueda;}
      else if(ValorProjecao == evento.DadoAtual){SubidaOuQuedaProjecao = EventoIgual;}

      // DADOS QUE A INTERPRETAÇÃO É INVERTIDA
      if(InverteInterpretacaoSubidaQueda==true)
      {
         if(evento.DadoAtual > evento.DadoAnterior){SubidaOuQuedaColorAtual = EventoCorQueda; CorFundoQuedaOuSubidaAtual = CorFundoQueda;}
         else if(evento.DadoAtual < evento.DadoAnterior){SubidaOuQuedaColorAtual = EventoCorSubida; CorFundoQuedaOuSubidaAtual = CorFundoSubida;}  
         
         if(evento.DadoAnterior > evento.DadoAnteAnterior){SubidaOuQuedaColorAnterior = EventoCorQueda; CorFundoQuedaOuSubidaAnterior = CorFundoQueda;}
         else if(evento.DadoAnterior < evento.DadoAnteAnterior){SubidaOuQuedaColorAnterior = EventoCorSubida; CorFundoQuedaOuSubidaAnterior = CorFundoSubida;} 
         
         if(evento.DadoAnteAnterior > evento.DadoMaisAntigo){SubidaOuQuedaColorAnteAnterior = EventoCorQueda; CorFundoQuedaOuSubidaAnteAnterior = CorFundoQueda;}
         else if(evento.DadoAnteAnterior < evento.DadoMaisAntigo){SubidaOuQuedaColorAnteAnterior = EventoCorSubida; CorFundoQuedaOuSubidaAnteAnterior = CorFundoSubida;}          
      }  
      
      // mudo as casas decimais para exibir
      evento.DadoAtual = evento.DadoAtual/1000000;
      evento.DadoAnterior = evento.DadoAnterior/1000000;
      evento.DadoAnteAnterior = evento.DadoAnteAnterior/1000000;
      ValorProjecao = ValorProjecao/1000000;     
        
        
      // INSERE OS DADOS ENCONTRADOS
      for(int j=0;j<12;j++)
      {
         //coluna1
         if(j==0)
         {
             //Evento             
            evento.NomeEvento = NoticiaCorrigida[linha]; // normaliza o nome das notícias
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,evento.NomeEvento,10);
            MudarAlinhamento(labelPares, ALIGN_LEFT,10);          
         }
         //coluna2
         else if(j==1)
         {
            // GRAFICO
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,"Grafico"+IntegerToString(linha),8);
         }
         //coluna3
         else if(j==2)
         {
            // Frequencia
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,evento.FrequenciaEvento,8);
         }
         //coluna4
         else if(j==3)
         {
            // Data
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,evento.DataEvento,8);
            MudarItensDisplayDados(labelPares,TimeToString(evento.DataEvento,TIME_DATE),8); 
         }
         //coluna5
         else if(j==4)
         {
            // Referencia
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);       
            if(evento.ReferenciaEvento < iTime(NULL,PERIOD_MN1,12))
              {
               MudarItensDisplayDados(labelPares,"-",8);
              }
            else
              {
               MudarItensDisplayDados(labelPares,TimeToString(evento.ReferenciaEvento,TIME_DATE),8);
              }
         }
         //coluna6
         else if(j==5)
         {
            // VALOR Projecao
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            SubidaOuQuedaProjecao = ValorProjecao !="-" ? SubidaOuQuedaProjecao : "";
            MudarItensDisplayDados(labelPares,SubidaOuQuedaProjecao+" "+DoubleToString(ValorProjecao,Decimais)+UnidadeValorProjecao,8);
            MudarCorFundoTexto(labelPares,clrSandyBrown,clrSnow,EventoCorPadrao);
         }
         //coluna7
         else if(j==6)
         {
            // Subida ou Descida Evento Atual
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,SubidaOuQuedaAtual,15);
            MudarCorFundoTexto(labelPares,SubidaOuQuedaColorAtual,CorFundoQuedaOuSubidaAtual,EventoCorPadrao); 
         }
         //coluna8
         else if(j==7)
         {
            // VALOR ATUAL
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,DoubleToString(evento.DadoAtual,Decimais)+UnidadeValor,9);
            MudarCorFundoTexto(labelPares,EventoCorPadrao,CorFundoQuedaOuSubidaAtual,EventoCorPadrao);
         }  
         //coluna9
         else if(j==8)
         {
            // Subida ou Descida Evento Anterior
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,SubidaOuQuedaAnterior,15);
            MudarCorFundoTexto(labelPares,SubidaOuQuedaColorAnterior,CorFundoQuedaOuSubidaAnterior,EventoCorPadrao);

         }
         //coluna10
         else if(j==9)
         {
            // Valor Anterior
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,DoubleToString(evento.DadoAnterior,Decimais)+UnidadeValor,9);         
            MudarCorFundoTexto(labelPares,EventoCorPadrao,CorFundoQuedaOuSubidaAnterior,EventoCorPadrao);
         }
         //coluna11
         else if(j==10)
         {
            // Subida ou Descida Evento Ante Anterior
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,SubidaOuQuedaAnteAnterior,15);
            MudarCorFundoTexto(labelPares,SubidaOuQuedaColorAnteAnterior,CorFundoQuedaOuSubidaAnteAnterior,EventoCorPadrao);
         }
         //coluna12
         else if(j==11)
         {
            // Valor AnteAnterior
            labelPares = "labelDadosEconomicos_c"+IntegerToString(j)+"_l"+IntegerToString(linha+1);
            MudarItensDisplayDados(labelPares,DoubleToString(evento.DadoAnteAnterior,Decimais)+UnidadeValor,9);
            MudarCorFundoTexto(labelPares,EventoCorPadrao,CorFundoQuedaOuSubidaAnteAnterior,EventoCorPadrao);
         }
      }
      }
   
return(true);
}


struct DadosEvento {
   string NomeEvento;
   string FrequenciaEvento;
   datetime DataEvento;
   datetime ReferenciaEvento;
   double DadoProjecao;
   double DadoAtual;
   double DadoAnterior;
   double DadoAnteAnterior;
   double DadoMaisAntigo;
   bool EventoEncontrado;
};


DadosEvento PegarDadosEvento(DadosEvento &evento, ulong NoticiasID)
{
      //--- nome do evento  
      //ulong event_id = ;
      string event_name;
      //--- array de valores do evento     
      MqlCalendarEvent event;
      
      if(CalendarEventById(NoticiasID,event))
      {
         evento.EventoEncontrado = true; // necessário para deixar em branco quando nao tiver encontrado nada
         event_name=event.name;
         
         if(event.frequency == 0) evento.FrequenciaEvento = "Indefinida";
         else if(event.frequency == 1) evento.FrequenciaEvento = "Mensal";
         else if(event.frequency == 2) evento.FrequenciaEvento = "Bimestral";
         else if(event.frequency == 3) evento.FrequenciaEvento = "Trimestral";
         else if(event.frequency == 4) evento.FrequenciaEvento = "Quadrimestral";
         
         //Print("Nome Evento:"+ event_name+" Importancia: "+event.importance+" Frequencia"+event.frequency);
         
      }
      else
      {
         evento.EventoEncontrado = false;
         PrintFormat("Falha ao obter a descrição do evento para event_d=%s, erro %d",
                  NoticiasID,GetLastError());
      }
  
   

   //defina os limites do intervalo de onde são tomados os eventos
   datetime date_from = iTime(NULL,PERIOD_MN1,12); // data Inicial
   datetime date_to= 0; // data atual
   MqlCalendarValue values[];
   if(CalendarValueHistoryByEvent(NoticiasID,values,date_from,date_to))
     {      
      for(int i=ArraySize(values)-1;i>=0;i--)
        {
         if(values[i].actual_value==-9223372036854775808)
           {
            ArrayRemove(values,i,1);
           }
        }
      
      //ArrayPrint(values);
      
      int EventoMaisRecente = ArraySize(values)-1;

      for(int i=0;i<ArraySize(values);i++)
        {
         //Print(values[i].impact_type);
         if(i == EventoMaisRecente-3) evento.DadoMaisAntigo = values[i].actual_value;
         else if(i == EventoMaisRecente-2) evento.DadoAnteAnterior = values[i].actual_value;
         else if(i == EventoMaisRecente-1) evento.DadoAnterior = values[i].actual_value;
         else if(i == EventoMaisRecente) {
         evento.DadoAtual = values[i].actual_value;
         evento.DataEvento = values[i].time;
         evento.ReferenciaEvento = values[i].period;
         evento.DadoProjecao = values[i].forecast_value;
         }
        }
     }
   else
     {
      PrintFormat("Erro! Falha ao obter valores para o evento NoticiasID=%d",NoticiasID);
      PrintFormat("Código de erro: %d",GetLastError());
     }
      
   evento.NomeEvento = event_name;
            
   return(evento);
}


bool GraficoDoEvento(int IDdoEvento)
{
   //DadosEvento evento;
   //GeraGraficoEvento(evento, NoticiasID[IDdoEvento]);
   

return(true);
}



//#include <Graphics\Graphic.mqh>
//+------------------------------------------------------------------+
//| inputs                                                           |
//+------------------------------------------------------------------+
//input bool Accumulative=true;
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
//
//DadosEvento GeraGraficoEvento(DadosEvento &evento, ulong NoticiasID)
//{
//
//      int Espacamento = AfastarPaineisAEsquerda == true ? DisplayLarguraBackgroud+1 : 0; //verifica se a opcao esta habilitada pra afastar
//      //--- nome do evento  
//      //ulong event_id = ;
//      string event_name;
//      //--- array de valores do evento     
//      MqlCalendarEvent event;
//      
//      if(CalendarEventById(NoticiasID,event))
//      {
//         evento.EventoEncontrado = true; // necessário para deixar em branco quando nao tiver encontrado nada
//         event_name=event.name;
//         
//         //Print("Nome Evento:"+ event_name+" Importancia: "+event.importance+" Frequencia"+event.frequency);
//         
//      }
//      else
//      {
//         evento.EventoEncontrado = false;
//         PrintFormat("Falha ao obter a descrição do evento para event_d=%s, erro %d",
//                  NoticiasID,GetLastError());
//      }
//  
//   
//
//   //defina os limites do intervalo de onde são tomados os eventos
//   datetime date_from = iTime(NULL,PERIOD_MN1,4); // data Inicial
//   datetime date_to= 0; // data atual
//   MqlCalendarValue values[];  
//   if(CalendarValueHistoryByEvent(NoticiasID,values,date_from,date_to))
//   {      
//      for(int i=ArraySize(values)-1;i>=0;i--)
//      {
//         if(values[i].actual_value==-9223372036854775808)
//         {
//            ArrayRemove(values,i,1);
//         }
//      }
//      
//      ArrayPrint(values);
//
//   CGraphic graphic;
//   graphic.Create(0,"Graphic",0,Espacamento,30,780,380);
////   double x[]={-10,-4,-1,2,3,4,5,6,7,8};
////   double y[]={-5,4,-10,23,17,18,-9,13,17,4};
////   CCurve *curve=graphic.CurveAdd(x,y,CURVE_LINES);
////   graphic.CurvePlotAll();
////   graphic.Update(); 
////   
////TimeToString(evento.DataEvento,TIME_DATE)
//      double ArrayValorEvento[];
//      double ArrayDataEvento[];
//      ArrayResize(ArrayValorEvento,ArraySize(values));
//      ArrayResize(ArrayDataEvento,ArraySize(values));
//      
//      for(int i=0;i<ArraySize(values);i++)
//      {
//         ArrayValorEvento[i] = values[i].actual_value/100000;
//         ArrayDataEvento[i] = (double)StringSubstr(TimeToString(values[i].time,TIME_DATE),5,6);
//         //ArrayDataEvento[i] = 4+i;
//      }
//   
//   CCurve *curve=graphic.CurveAdd(ArrayDataEvento,ArrayValorEvento,CURVE_LINES);
//   graphic.CurvePlotAll();
//   graphic.Update(); 
//   
//    ArrayPrint(ArrayDataEvento);
//    
//    ArrayPrint(ArrayValorEvento);
//
//      //   for(int i=0;i<ArraySize(values);i++)
//      //     {
//      //      //Print(values[i].impact_type);
//      //      if(i == EventoMaisRecente-3) evento.DadoMaisAntigo = values[i].actual_value;
//      //      else if(i == EventoMaisRecente-2) evento.DadoAnteAnterior = values[i].actual_value;
//      //      else if(i == EventoMaisRecente-1) evento.DadoAnterior = values[i].actual_value;
//      //      else if(i == EventoMaisRecente) {
//      //      evento.DadoAtual = values[i].actual_value;
//      //      evento.DataEvento = values[i].time;
//      //      evento.ReferenciaEvento = values[i].period;
//      //      evento.DadoProjecao = values[i].forecast_value;
//      //      }
//      //     }
//   }
//   else
//   {
//      PrintFormat("Erro! Falha ao obter valores para o evento NoticiasID=%d",NoticiasID);
//      PrintFormat("Código de erro: %d",GetLastError());
//   }
//      
//   //evento.NomeEvento = event_name;
//   
//   //Print("entrou "+"ID "+NoticiasID);
//
//
//
//
//
//            
//   return(evento);
//}



bool TodasOperacoesAbertas()
{      
   int numColunas = 10;
   int altura = 25;
   int largura = 65;
   
   // CRIAR COLUNAS E LINHAS
   int label1Espacamento = AfastarPaineisAEsquerda == true ? DisplayLarguraBackgroud+1 : 0; //verifica se a opcao esta habilitada pra afastar
   int label2Espacamento = (numColunas*largura)+label1Espacamento;
   int DistanciaEntreBlocos = 5;
   string objName;
   int x,y;
   int xPadding = 0;
   int yPadding = 52;
   color corFundo = clrSnow;
   color corTexto = clrDarkSlateGray;

   // DADOS DINAMICOS
   int NLinhaCompra = 0;
   int NLinhaVenda = 0;
   double TempoOperacao;
   string TempoOperacaoAjustado;
   int MilisegundosEmDias = 86400000;
   int CasasDecimais = 0;
   string AtivoOperacao;
   double PrecoAberturaOperacao;
   double VolumeOperacao;
   double PrecoAtualOperacao;
   double PontosAgoraOperacao;
   double PontosAgoraMostrarCorrigido;
   double SwapOperacao;
   double LucroOperacao;
   color corFundoCompra = clrMediumBlue;
   color corFundoVenda = clrCrimson;
   color corTextoBranco = clrSnow;
   color CorLucroOuPrejuizo;
   color CorPagandoOuRecebendoSwap;
   
   // pego os pares operados
   for(int i=0;i<PositionsTotal();i++)
      {         
         PositionGetTicket(i);
         AtivoOperacao = PositionGetString(POSITION_SYMBOL);         
         CasasDecimais = int(SymbolInfoInteger(AtivoOperacao,SYMBOL_DIGITS));
         
         VolumeOperacao = PositionGetDouble(POSITION_VOLUME);
         PrecoAberturaOperacao = PositionGetDouble(POSITION_PRICE_OPEN);
         PrecoAtualOperacao = PositionGetDouble(POSITION_PRICE_CURRENT);
         
         // Verifica se a moeda operada for JPY
         OrientacaoJPY = StringFind(AtivoOperacao, "JPY") >= 0 ? 100 : 1;
         PontosAgoraOperacao = (PrecoAberturaOperacao - PrecoAtualOperacao)*100000/OrientacaoJPY;
       
         TempoOperacao = (long)TimeCurrent() * 1000 - PositionGetInteger(POSITION_TIME_MSC);
         
         SwapOperacao = PositionGetDouble(POSITION_SWAP);                 
         LucroOperacao = PositionGetDouble(POSITION_PROFIT);
         
         PontosAgoraMostrarCorrigido = PontosAgoraOperacao < 0 ? PontosAgoraOperacao*-1 : PontosAgoraOperacao;
         CorLucroOuPrejuizo = LucroOperacao < 0 ? clrMistyRose : C'195, 216, 192';
         CorPagandoOuRecebendoSwap = SwapOperacao < 0 ? clrMistyRose : C'195, 216, 192';
         
   // PRIMEIRO BLOCO COMPRA
   if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
    {
      for(int j=0;j<numColunas;j++)
        {

            objName = "labelOperacoes1_c"+IntegerToString(j)+"_l"+IntegerToString(NLinhaCompra+1);
            x = xPadding + j*largura;
            y = yPadding + (NLinhaCompra+1)*altura;
   
            CreateLabel(objName,x,y,largura,altura,label1Espacamento,corFundo,corTexto);
                     
            //coluna1
            if(j==0)
            {
                // ATIVO
               MudarItensDisplayDados(objName,AtivoOperacao,10);
                   
            }
            //coluna2
            else if(j==1)
            {
                // OPERAÇÃO
               MudarItensDisplayDados(objName,"COMPRADO",9);
               MudarCorFundoTexto(objName,corTextoBranco,corFundoCompra,corTextoBranco);
            }
            //coluna3
            else if(j==2)
            {
                // INICIO OPERACAO
               MudarItensDisplayDados(objName,DoubleToString(PrecoAberturaOperacao,CasasDecimais),10); 
            }
            //coluna4
            else if(j==3)
            {
                // PREÇO HOJE
               MudarItensDisplayDados(objName,DoubleToString(PrecoAtualOperacao,CasasDecimais),10);  

            }         
            //coluna5
            else if(j==4)
            {
                // TEMPO
               TempoOperacaoAjustado = TempoOperacao/MilisegundosEmDias<1 ? IntegerToString(TempoOperacao/3600000)+" horas" : IntegerToString(TempoOperacao/MilisegundosEmDias)+" dias";
               MudarItensDisplayDados(objName,TempoOperacaoAjustado,10);   
            }   
            //coluna6
            else if(j==5)
            {
                // PONTOS
               CorLucroOuPrejuizo = PontosAgoraOperacao < 0 ? C'195, 216, 192' : clrMistyRose;               
               MudarItensDisplayDados(objName,DoubleToString(PontosAgoraMostrarCorrigido,0),10);
               MudarCorFundoTexto(objName,corTexto,CorLucroOuPrejuizo,corTexto);
            }   
            //coluna7
            else if(j==6)
            {
                // LOTE
               MudarItensDisplayDados(objName,VolumeOperacao,10);  
            }
            //coluna8
            else if(j==7)
            {
                // SWAP
               MudarItensDisplayDados(objName,DoubleToString(SwapOperacao,2),10);
               MudarCorFundoTexto(objName,corTexto,CorPagandoOuRecebendoSwap,corTexto); 
            } 
            //coluna9
            else if(j==8)
            {
                // LUCRO
               MudarItensDisplayDados(objName,DoubleToString(LucroOperacao,2),10);
               MudarCorFundoTexto(objName,corTexto,CorLucroOuPrejuizo,corTexto); 
            }
            //coluna10
            else if(j==9)
            {
                // LUCRO PROPORCIONAL 0.01
               MudarItensDisplayDados(objName,DoubleToString(LucroOperacao/(VolumeOperacao*100),2),10);
               MudarCorFundoTexto(objName,corTexto,CorLucroOuPrejuizo,corTexto); 
            }        
      }
            // faz a contagem pra caso a proxima linha seja acrescentada corretamente
            NLinhaCompra += 1;  
   } 


   // SEGUNDO BLOCO
   else if(PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
    {
      for(int j=0;j<numColunas;j++)
        {
            objName = "labelOperacoes2_c"+IntegerToString(j)+"_l"+IntegerToString(NLinhaVenda+1);
            x = xPadding + DistanciaEntreBlocos + j*largura;
            y = yPadding + (NLinhaVenda+1)*altura;
   
            CreateLabel(objName,x,y,largura,altura,label2Espacamento,corFundo,corTexto);
 
            //coluna1
            if(j==0)
            {
                // ATIVO
               MudarItensDisplayDados(objName,AtivoOperacao,10);
                   
            }
            //coluna2
            else if(j==1)
            {
                // OPERAÇÃO
               MudarItensDisplayDados(objName,"VENDIDO",9);
               MudarCorFundoTexto(objName,corTextoBranco,corFundoVenda,corTextoBranco);
            }
            //coluna3
            else if(j==2)
            {
                // INICIO OPERACAO
               MudarItensDisplayDados(objName,DoubleToString(PrecoAberturaOperacao,CasasDecimais),10); 
            }
            //coluna4
            else if(j==3)
            {
                // PREÇO HOJE
               MudarItensDisplayDados(objName,DoubleToString(PrecoAtualOperacao,CasasDecimais),10);  

            }         
            //coluna5
            else if(j==4)
            {
                // TEMPO
               TempoOperacaoAjustado = TempoOperacao/MilisegundosEmDias<1 ? IntegerToString(TempoOperacao/3600000)+" horas" : IntegerToString(TempoOperacao/MilisegundosEmDias)+" dias";
               MudarItensDisplayDados(objName,TempoOperacaoAjustado,10);   
            }   
            //coluna6
            else if(j==5)
            {
                // PONTOS
               CorLucroOuPrejuizo = PontosAgoraOperacao < 0 ? clrMistyRose : C'195, 216, 192';               
               MudarItensDisplayDados(objName,DoubleToString(PontosAgoraMostrarCorrigido,0),10);
               MudarCorFundoTexto(objName,corTexto,CorLucroOuPrejuizo,corTexto);
            }   
            //coluna7
            else if(j==6)
            {
                // LOTE
               MudarItensDisplayDados(objName,VolumeOperacao,10);  
            } 
            //coluna8
            else if(j==7)
            {
                // SWAP
               MudarItensDisplayDados(objName,DoubleToString(SwapOperacao,2),10);
               MudarCorFundoTexto(objName,corTexto,CorPagandoOuRecebendoSwap,corTexto); 
            }
            //coluna9
            else if(j==8)
            {
                // LUCRO
               MudarItensDisplayDados(objName,DoubleToString(LucroOperacao,2),10);
               MudarCorFundoTexto(objName,corTexto,CorLucroOuPrejuizo,corTexto); 
            }
            //coluna10
            else if(j==9)
            {
                // LUCRO PROPORCIONAL 0.01
               MudarItensDisplayDados(objName,DoubleToString(LucroOperacao/(VolumeOperacao*100),2),10);
               MudarCorFundoTexto(objName,corTexto,CorLucroOuPrejuizo,corTexto); 
            } 
         }
         // faz a contagem pra caso a proxima linha seja acrescentada corretamente
         NLinhaVenda += 1; 
      }   
     
   }

   // INSERINDO TITULO
   string labelTitulo1;
   string labelTitulo2;   
   string tituloPares[10] = {"ATIVO","OPERAÇÃO","ENTRADA","ATUAL","TEMPO","PONTOS","LOTE","SWAP","LUCRO","PROPO 0.01"};
   color corFundoTitulo = clrDarkSlateGray;
   color corTextoTitulo = clrSnow;
   for(int j=0;j<numColunas;j++)
   {
      x = xPadding + j*largura;
      y = yPadding;
      
      labelTitulo1 = "labelOperacoes1_c"+IntegerToString(j)+"_l0";
      labelTitulo2 = "labelOperacoes2_c"+IntegerToString(j)+"_l0";
      
      CreateLabel(labelTitulo1,x,y,largura,altura,label1Espacamento,corFundoTitulo,corTextoTitulo);
      CreateLabel(labelTitulo2,x+DistanciaEntreBlocos,y,largura,altura,label2Espacamento,corFundoTitulo,corTextoTitulo);

      if(j==0)
        {
         MudarTituloDisplayPares(labelTitulo1,tituloPares[j]+" "+IntegerToString(NLinhaCompra),corFundoTitulo,corTextoTitulo);
         MudarTituloDisplayPares(labelTitulo2,tituloPares[j]+" "+IntegerToString(NLinhaVenda),corFundoTitulo,corTextoTitulo);     
        }
      else
        {
         MudarTituloDisplayPares(labelTitulo1,tituloPares[j],corFundoTitulo,corTextoTitulo);
         MudarTituloDisplayPares(labelTitulo2,tituloPares[j],corFundoTitulo,corTextoTitulo);  
        }   
   }
   
   
   ChartRedraw();

return(true);
}


bool CreateLabelTimeFrame(string objName,int x_dist, int y_dist, int largura, int altura, int DistanciaEspacamento, string texto)
{
   if( ObjectFind(0,objName)>=0 ) ObjectDelete(0,objName);
   ObjectCreate(0,objName,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName,OBJPROP_XDISTANCE,DistanciaEspacamento+x_dist);
   ObjectSetInteger(0,objName,OBJPROP_YDISTANCE,y_dist);
   ObjectSetInteger(0,objName,OBJPROP_XSIZE,largura);
   ObjectSetInteger(0,objName,OBJPROP_YSIZE,altura);
   ObjectSetString(0,objName,OBJPROP_TEXT,texto);
   ObjectSetString(0,objName,OBJPROP_FONT,"Consolas Bold");
   ObjectSetInteger(0,objName,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,objName,OBJPROP_COLOR,C'102, 102, 102');
   ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,clrSnow);
   ObjectSetInteger(0,objName,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,objName,OBJPROP_READONLY,true);
   ObjectSetInteger(0,objName,OBJPROP_ALIGN,ALIGN_CENTER);  
   ObjectSetInteger(0,objName,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   
   return(true);
}


bool CreateLabel(string objName,int x_dist, int y_dist, int largura, int altura, int DistanciaEspacamento, color corFundo, color corTexto)
{
   if( ObjectFind(0,objName)>=0 ) ObjectDelete(0,objName);
   ObjectCreate(0,objName,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName,OBJPROP_XDISTANCE,DistanciaEspacamento+x_dist);
   ObjectSetInteger(0,objName,OBJPROP_YDISTANCE,y_dist);
   ObjectSetInteger(0,objName,OBJPROP_XSIZE,largura);
   ObjectSetInteger(0,objName,OBJPROP_YSIZE,altura);
   ObjectSetString(0,objName,OBJPROP_TEXT,"-");
   ObjectSetString(0,objName,OBJPROP_FONT,"Consolas Bold");
   ObjectSetInteger(0,objName,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,objName,OBJPROP_COLOR,corTexto);
   ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,corFundo);
   //ObjectSetInteger(0,objName,OBJPROP_BORDER_COLOR,clrDarkSlateGray);
   ObjectSetInteger(0,objName,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,objName,OBJPROP_READONLY,true);
   ObjectSetInteger(0,objName,OBJPROP_ALIGN,ALIGN_CENTER);  
   ObjectSetInteger(0,objName,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   
   return(true);
}


bool CreateLabelPreco(string objName,int x_dist, int y_dist, int largura, int altura, int DistanciaEspacamento, color corFundo, color corTexto, color corBorda)
{
   if( ObjectFind(0,objName)>=0 ) ObjectDelete(0,objName);
   ObjectCreate(0,objName,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName,OBJPROP_XDISTANCE,DistanciaEspacamento+x_dist);
   ObjectSetInteger(0,objName,OBJPROP_YDISTANCE,y_dist);
   ObjectSetInteger(0,objName,OBJPROP_XSIZE,largura);
   ObjectSetInteger(0,objName,OBJPROP_YSIZE,altura);
   ObjectSetString(0,objName,OBJPROP_TEXT,"-");
   ObjectSetString(0,objName,OBJPROP_FONT,"Consolas Bold");
   ObjectSetInteger(0,objName,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,objName,OBJPROP_COLOR,corTexto);
   ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,corFundo);
   ObjectSetInteger(0,objName,OBJPROP_BORDER_COLOR,corBorda);
   ObjectSetInteger(0,objName,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,objName,OBJPROP_READONLY,true);
   ObjectSetInteger(0,objName,OBJPROP_ALIGN,ALIGN_CENTER);  
   ObjectSetInteger(0,objName,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   
   return(true);
}

bool CreateLabelEdit(string objName,int x_dist, int y_dist, int largura, int altura, int DistanciaEspacamento)
{
   if( ObjectFind(0,objName)>=0 ) ObjectDelete(0,objName);
   ObjectCreate(0,objName,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName,OBJPROP_XDISTANCE,DistanciaEspacamento+x_dist);
   ObjectSetInteger(0,objName,OBJPROP_YDISTANCE,y_dist);
   ObjectSetInteger(0,objName,OBJPROP_XSIZE,largura);
   ObjectSetInteger(0,objName,OBJPROP_YSIZE,altura);
   ObjectSetString(0,objName,OBJPROP_TEXT,"DIGITE");
   ObjectSetString(0,objName,OBJPROP_FONT,"Consolas Bold");
   ObjectSetInteger(0,objName,OBJPROP_FONTSIZE,10);
   ObjectSetInteger(0,objName,OBJPROP_COLOR,clrDarkSlateGray);
   ObjectSetInteger(0,objName,OBJPROP_BGCOLOR,clrSnow);
   ObjectSetInteger(0,objName,OBJPROP_ALIGN,ALIGN_CENTER);  
   ObjectSetInteger(0,objName,OBJPROP_CORNER,CORNER_LEFT_UPPER);
   
   return(true);
}

bool MudarLaguraLabel(string objName,int x_dist, int largura, int DistanciaEspacamento)
{
   ObjectSetInteger(0,objName,OBJPROP_XDISTANCE,DistanciaEspacamento+x_dist);
   ObjectSetInteger(0,objName,OBJPROP_XSIZE,largura);
   
   return(true);
}


bool MudarItensDisplayPares(string labelPares,string tituloPares,int fonte,color corFundo,color corTexto)
{
   ObjectSetString(0,labelPares,OBJPROP_TEXT,tituloPares);
   ObjectSetInteger(0,labelPares,OBJPROP_FONTSIZE,fonte);
   ObjectSetInteger(0,labelPares,OBJPROP_COLOR,corTexto);
   ObjectSetInteger(0,labelPares,OBJPROP_BGCOLOR,corFundo);
   //ObjectSetInteger(0,labelPares,OBJPROP_BORDER_COLOR,clrDarkSlateGray);

return(true);
}

bool MudarItensDisplayDados(string labelTitulo,string tituloPares,int fonte)
{
   ObjectSetString(0,labelTitulo,OBJPROP_TEXT,tituloPares);
   ObjectSetInteger(0,labelTitulo,OBJPROP_FONTSIZE,fonte);

return(true);}



bool MudarTituloDisplayPares(string labelPares,string tituloPares,color corFundo,color corTexto)
{
   ObjectSetString(0,labelPares,OBJPROP_TEXT,tituloPares);
   ObjectSetInteger(0,labelPares,OBJPROP_FONTSIZE,8);
   ObjectSetInteger(0,labelPares,OBJPROP_COLOR,corTexto);
   ObjectSetInteger(0,labelPares,OBJPROP_BGCOLOR,corFundo);

return(true);
}


bool MudarCorFundo(string labelPares,color corFundo,color corTexto)
{
   ObjectSetInteger(0,labelPares,OBJPROP_COLOR,corTexto);
   ObjectSetInteger(0,labelPares,OBJPROP_BGCOLOR,corFundo);

return(true);
}


bool MudarCorFundoTexto(string labelPares,color corTexto,color corFundo,color corBorda)
{
   ObjectSetInteger(0,labelPares,OBJPROP_COLOR,corTexto);
   ObjectSetInteger(0,labelPares,OBJPROP_BGCOLOR,corFundo);
   ObjectSetInteger(0,labelPares,OBJPROP_BORDER_COLOR,corBorda);

return(true);
}


bool MudarAlinhamento(string objName, ENUM_ALIGN_MODE alinhamento, int tamanhoFonte)
{
   ObjectSetInteger(0,objName,OBJPROP_ALIGN,alinhamento);
   ObjectSetInteger(0,objName,OBJPROP_FONTSIZE,tamanhoFonte);
   
return(true);
}