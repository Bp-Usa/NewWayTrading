string CalculaCruzamento6x21(string AtivoCalculo)
  {

//---
   int MA_1_Period = 6;              // Período médio da 1ª MA
   int MA_2_Period = 21;             // Período médio da 2ª MA
   ENUM_MA_METHOD MA_1_Method = MODE_SMA;       // Método para calcular MA1
   ENUM_MA_METHOD MA_2_Method = MODE_SMA;       // Método para calcular MA2
   ENUM_APPLIED_PRICE MA_1_Price = PRICE_CLOSE;    // Método para calcular o preço MA1
   ENUM_APPLIED_PRICE MA_2_Price = PRICE_CLOSE;    // Método para calcular o preço MA2
   int MA_1_Shift = 0;              // Mudança do indicador MA1
   int MA_2_Shift = 0;              // Mudança do indicador MA2
   //---
   double MA1_0;                           // Valor atual da 1ª MA
   double MA1_1;                           // Valor anterior de 1ª MA
   double MA2_0;                           // Valor atual da 2ª MA
   double MA2_1;                           // Valor anterior de 2ª MA
   string PosCross;                        // o fato de que há uma posição de cruzamento
   //---
   int    handle_iMA_1;                     // variável para armazenar o identificador do indicador iMA
   int    handle_iMA_2;                    // variável para armazenar o identificador do indicador iMA
   int barraUltimoCruzamento=0;
   int TipoCruzamento;
//---

   ENUM_TIMEFRAMES timeframe;
   
   if(TimeFrameCruzamento == 60) timeframe = PERIOD_H1;
   else if(TimeFrameCruzamento == 30) {timeframe = PERIOD_M30;}
   else if(TimeFrameCruzamento == 15) {timeframe = PERIOD_M15;}

//--- criar handle do indicador iMA
   handle_iMA_1=iMA(AtivoCalculo,timeframe,MA_1_Period,MA_1_Shift,MA_1_Method,MA_1_Price);
//--- se o identificador não for criado
   if(handle_iMA_1==INVALID_HANDLE)
     {
      //--- falha e mostre o código de erro
      PrintFormat("Failed to create handle of the iMA indicator for the symbol %s/%s, error code %d",
                  AtivoCalculo,
                  EnumToString(timeframe),
                  GetLastError());
     }

//--- criar handle do indicador iMA
   handle_iMA_2=iMA(AtivoCalculo,timeframe,MA_2_Period,MA_2_Shift,MA_2_Method,MA_2_Price);
//--- se o identificador não for criado
   if(handle_iMA_2==INVALID_HANDLE)
     {
      //--- falha e mostre o código de erro
      PrintFormat("Failed to create handle of the iMA indicator for the symbol %s/%s, error code %d",
                  AtivoCalculo,
                  EnumToString(timeframe),
                  GetLastError());
     }
//---

   // Quantas Velas Analisar
   for(int i=0;i<VelasAnalisarCruzamento;i++)
     {     
         MA1_0=iMAGet(handle_iMA_1,i+0);      // Valor atual da 1ª MA
         MA1_1=iMAGet(handle_iMA_1,i+1);      // Valor anterior de 1ª MA
         MA2_0=iMAGet(handle_iMA_2,i+0);      // Valor atual da 2ª MA
         MA2_1=iMAGet(handle_iMA_2,i+1);      // Valor anterior de 2ª MA
         
         TipoCruzamento = CrossPositionOpen(MA1_0,MA1_1,MA2_0,MA2_1);
         
         if(TipoCruzamento==1) // Movimento ascendente = Comprar
           {
            //Time_0=iTime(Symbol(),PERIOD_CURRENT,i);
            //barraUltimoCruzamento=iBarShift(Symbol(),PERIOD_CURRENT,Time_0);
            barraUltimoCruzamento=i+1;
            PosCross = "Compra";
            break;
           }
         else if(TipoCruzamento==2) // Movimento para baixo = Vender
           {
            barraUltimoCruzamento=i+1;
            PosCross = "Venda";
            break;
           }    
      }   
   
   string MsgRetorno = TipoCruzamento!=0 ? PosCross+" "+barraUltimoCruzamento+"atras" : "-";
   //string MsgRetorno = AtivoCalculo+" - "+PosCross+" - Cruzou a "+barraUltimoCruzamento+" Barras Anteriores - "+EnumToString(timeframe);
   // --- valor de retorno de prev_calculated para a próxima chamada

   return(MsgRetorno);
  }

//+------------------------------------------------------------------+
//|   Identifica Cruzamento                                          |
//+------------------------------------------------------------------+
int CrossPositionOpen(double MA1_0, double MA1_1, double MA2_0, double MA2_1)
  {
   int PosDirecao=0;
   if((MA1_1<=MA2_0 && MA1_0>MA2_0) || (MA1_1<MA2_0 && MA1_0>=MA2_0)) // Cruzando de baixo para cima
     {
      PosDirecao=1;
     }
   if((MA1_1>=MA2_0 && MA1_0<MA2_0) || (MA1_1>MA2_0 && MA1_0<=MA2_0)) // Cruzando de cima para baixo
     {
      PosDirecao=2;
     }
   return(PosDirecao);                                          // Retorne a direção cruzada.
  }

//+------------------------------------------------------------------+
//| Obtenha o valor dos buffers para o iMA                              |
//+------------------------------------------------------------------+
double iMAGet(const int handle,const int index)
  {
   double MA[];
   ArraySetAsSeries(MA,true);
//--- redefinir código de erro
   ResetLastError();
//--- preencha uma parte do array iMABuffer com valores do buffer do indicador que tem índice 0
   if(CopyBuffer(handle,0,0,index+1,MA)<0)
     {
      //--- se a cópia falhar, informe o código de erro
      PrintFormat("Failed to copy data from the iMA indicator, error code %d",GetLastError());
      //--- sair com resultado zero - significa que o indicador é considerado como não calculado
      return(0.0);
     }
   return(MA[index]);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
