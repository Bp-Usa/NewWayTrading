string CalculaCruzamento6x21(string AtivoCalculo)
  {

//---
   int MA_Rapida_Period = 6;              // Período médio da 1ª MA
   int MA_Lenta_Period = 21;             // Período médio da 2ª MA
   int MA_Preditiva_Period = 3;             // Período médio da MA MAPreditiva
   ENUM_MA_METHOD MA_Rapida_Method = MODE_SMA;       // Método para calcular MA1
   ENUM_MA_METHOD MA_Lenta_Method = MODE_SMA;       // Método para calcular MA2
   ENUM_MA_METHOD MA_Preditiva_Method = MODE_SMA;       // Método para calcular MAPreditiva
   ENUM_APPLIED_PRICE MA_Rapida_Price = PRICE_CLOSE;    // Método para calcular o preço MA1
   ENUM_APPLIED_PRICE MA_Lenta_Price = PRICE_CLOSE;    // Método para calcular o preço MA2
   ENUM_APPLIED_PRICE MA_Preditiva_Price = PRICE_CLOSE;    // Método para calcular o preço MAPreditiva
   int MA_Rapida_Shift = 0;              // Mudança do indicador MA1
   int MA_Lenta_Shift = 0;              // Mudança do indicador MA2
   int MA_Preditiva_Shift = 0;              // Mudança do indicador MA2
   //---
   double MARapida_0;                           // Valor atual da 1ª MA
   double MARapida_1;                           // Valor anterior de 1ª MA
   double MALenta_0;                           // Valor atual da 2ª MA
   double MALenta_1;                           // Valor anterior de 2ª MA
   double MAPreditiva_0;                           // Valor atual da MAPreditiva
   double MAPreditiva_1;                           // Valor anterior MAPreditiva
   string PosCross;                        // o fato de que há uma posição de cruzamento
   //---
   int    handle_iMA_Rapida;                     // variável para armazenar o identificador do indicador iMA
   int    handle_iMA_Lenta;                    // variável para armazenar o identificador do indicador iMA
   int    handle_iMA_Preditiva;                    // variável para armazenar o identificador do indicador iMAPreditiva
   int barraUltimoCruzamento=0;
   int TipoCruzamento;
   datetime Tempo_AGORA = TimeCurrent();
   datetime Tempo_Notificacao;   
//---

   ENUM_TIMEFRAMES timeframe;
   
   if(TimeFrameCruzamento == 60) timeframe = PERIOD_H1;
   else if(TimeFrameCruzamento == 30) {timeframe = PERIOD_M30;}
   else if(TimeFrameCruzamento == 15) {timeframe = PERIOD_M15;}

//--- handle do indicador iMA Rápida
   handle_iMA_Rapida=iMA(AtivoCalculo,timeframe,MA_Rapida_Period,MA_Rapida_Shift,MA_Rapida_Method,MA_Rapida_Price);
//--- se o identificador não for criado
   if(handle_iMA_Rapida==INVALID_HANDLE)
     {
      //--- falha e mostre o código de erro
      PrintFormat("Failed to create handle of the iMA indicator for the symbol %s/%s, error code %d",
                  AtivoCalculo,
                  EnumToString(timeframe),
                  GetLastError());
     }

//--- handle do indicador iMA Lenta
   handle_iMA_Lenta=iMA(AtivoCalculo,timeframe,MA_Lenta_Period,MA_Lenta_Shift,MA_Lenta_Method,MA_Lenta_Price);
//--- se o identificador não for criado
   if(handle_iMA_Lenta==INVALID_HANDLE)
     {
      //--- falha e mostre o código de erro
      PrintFormat("Failed to create handle of the iMA indicator for the symbol %s/%s, error code %d",
                  AtivoCalculo,
                  EnumToString(timeframe),
                  GetLastError());
     }
//---

//--- handle do indicador iMA Preditiva Rapida
   handle_iMA_Preditiva=iMA(AtivoCalculo,timeframe,MA_Preditiva_Period,MA_Preditiva_Shift,MA_Preditiva_Method,MA_Preditiva_Price);
//--- se o identificador não for criado
   if(handle_iMA_Preditiva==INVALID_HANDLE)
     {
      //--- falha e mostre o código de erro
      PrintFormat("Failed to create handle of the iMA indicator for the symbol %s/%s, error code %d",
                  AtivoCalculo,
                  EnumToString(timeframe),
                  GetLastError());
     }
//---
   string MsgRetorno;
   
   // Quantas Velas Analisar
   for(int i=0;i<VelasAnalisarCruzamento;i++)
     {     
         MARapida_0=iMAGet(handle_iMA_Rapida,i+0);      // Valor atual da 1ª MA
         MARapida_1=iMAGet(handle_iMA_Rapida,i+1);      // Valor anterior de 1ª MA
         MALenta_0=iMAGet(handle_iMA_Lenta,i+0);      // Valor atual da 2ª MA
         MALenta_1=iMAGet(handle_iMA_Lenta,i+1);      // Valor anterior de 2ª MA
                  
         TipoCruzamento = CrossPositionOpen(MARapida_0,MARapida_1,MALenta_0,MALenta_1);
         
         if(TipoCruzamento==1) // Movimento ascendente = Comprar
           {
            Tempo_Notificacao=iTime(AtivoCalculo,timeframe,i);
            //barraUltimoCruzamento=iBarShift(Symbol(),PERIOD_CURRENT,Time_0);
            barraUltimoCruzamento=i+1;
            PosCross = "COMPRA";
            break;
           }
         else if(TipoCruzamento==2) // Movimento para baixo = Vender
           {
            Tempo_Notificacao=iTime(AtivoCalculo,timeframe,i);
            barraUltimoCruzamento=i+1;
            PosCross = "VENDA";
            break;
           }    
      }   
      
   if(TipoCruzamento==0)
     {
      for(int i=0;i<3;i++)
        { 
         MALenta_0=iMAGet(handle_iMA_Lenta,i+0);      // Valor atual da 2ª MA
         MALenta_1=iMAGet(handle_iMA_Lenta,i+1);      // Valor anterior de 2ª MA
         MAPreditiva_0=iMAGet(handle_iMA_Preditiva,i+0);      // Valor atual da MA Preditiva
         MAPreditiva_1=iMAGet(handle_iMA_Preditiva,i+1);      // Valor anterior de MA Preditiva
                  
         TipoCruzamento = CrossPositionOpen(MAPreditiva_0,MAPreditiva_1,MALenta_0,MALenta_1);
         
         if(TipoCruzamento==1) // Movimento ascendente = Comprar
           {
            //Time_0=iTime(Symbol(),PERIOD_CURRENT,i);
            //barraUltimoCruzamento=iBarShift(Symbol(),PERIOD_CURRENT,Time_0);
            PosCross = "PROXIMO ▲";
            break;
           }
         else if(TipoCruzamento==2) // Movimento para baixo = Vender
           {
            PosCross = "PROXIMO ▼";
            break;
           }
         }
      // Se continuar zerado entao nao tem cruzamento nem preditivo
      MsgRetorno = TipoCruzamento!=0 ? PosCross : "-";
     }
   else
     {
      // --- Notificacao      
      if(Tempo_AGORA <= Tempo_Notificacao || Tempo_AGORA >= TimerAguardar2)
      {
         if(barraUltimoCruzamento ==1)
         { 
            if(AlertaCruzamentoTempoEscolha !=0)
            {
               if(DiferenciaSomCruzamento==true)
                 {
                  PlaySound("alert2.wav");
                  Print("Cruzamento das Linhas 6x21 no "+AtivoCalculo+" de "+PosCross);
                 }
               else
                 {
                  Alert("Cruzamento das Linhas 6x21 no ",AtivoCalculo," de ",PosCross);
                 }              
               TimerAguardar2 = TimeCurrent() + AlertaCruzamentoTempoEscolha; // alertas em segundos
            }
            if(AlertaCruzamentoCelular==true)
            {
               SendNotification("Cruzamento das Linhas 6x21 no "+AtivoCalculo+" de "+PosCross);
               TimerAguardar2 = TimeCurrent() + AlertaCruzamentoTempoEscolha; // alertas em segundos
            }
         }     
      }
     
      MsgRetorno = PosCross+" "+barraUltimoCruzamento+" atras";
     }  
            

   return(MsgRetorno);
  }

//+------------------------------------------------------------------+
//|   Identifica Cruzamento                                          |
//+------------------------------------------------------------------+
int CrossPositionOpen(double MARapida_0, double MARapida_1, double MALenta_0, double MALenta_1)
  {
   int PosDirecao=0;
   if((MARapida_1<=MALenta_0 && MARapida_0>MALenta_0) || (MARapida_1<MALenta_0 && MARapida_0>=MALenta_0)) // Cruzando de baixo para cima
     {
      PosDirecao=1;
     }
   if((MARapida_1>=MALenta_0 && MARapida_0<MALenta_0) || (MARapida_1>MALenta_0 && MARapida_0<=MALenta_0)) // Cruzando de cima para baixo
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