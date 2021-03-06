// variaveis
   int DisplayLarguraBackgroud = 175;
   int Bloco1 = 27, Bloco2 = 42, Bloco3 = 41, Bloco4 = 80, Bloco5 = 25;
   int DisplayAlturaBackgroud = Bloco1+Bloco2+Bloco3+Bloco4+Bloco5+74;
   color CorQuadroOrientacao;
   int FonteBase1 = 8;
   int FonteBase2 = 9;
   int FontePaddingLeft = 7;
   int PosicaoDistanciaMediana = 88;
   int LarguraMolduraTraz = DisplayLarguraBackgroud-4;
   int LarguraMolduraFrente = DisplayLarguraBackgroud-8;
   color BackgroudColor = C'36,46,65';
   color BackgroundColorMoldura = C'25,56,95';
   int CorrigirPixelsValor = CorrigirPixels != 0 ? CorrigirPixels - CorrigirPixels/6 : 0;
   int AbaixarPosicaoDisplay = AbaixarDisplay == true ? 90 : 0;

bool CriaDisplayLotes(){
   
   // BOTAO ESCONDER DISPLAY
   if(ObjectFind(0, "EsconderDisplayBtn")>=0) ObjectDelete(0, "EsconderDisplayBtn");   
   ObjectCreate(0,"EsconderDisplayBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "EsconderDisplayBtn", OBJPROP_TEXT,"-");
   ObjectSetString(0,"EsconderDisplayBtn",OBJPROP_FONT, "Arial Black");
   ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XSIZE,22);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_YSIZE,12);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_YDISTANCE,17+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"EsconderDisplayBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0,"EsconderDisplayBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_BORDER_COLOR,C'57,83,108');
   
   // BOTAO CRIAR MENU SECUNDÁRIO
   if(ObjectFind(0, "MenuSecundarioBtn")>=0) ObjectDelete(0, "MenuSecundarioBtn");   
   ObjectCreate(0,"MenuSecundarioBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "MenuSecundarioBtn", OBJPROP_TEXT,"Menu");
   ObjectSetString(0, "MenuSecundarioBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"MenuSecundarioBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_XSIZE,40);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_YSIZE,11);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_XDISTANCE,125);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_YDISTANCE,18+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0, "MenuSecundarioBtn",OBJPROP_BORDER_COLOR,C'57,83,108');
   
   // *** Moldura 1 Traz
   if(ObjectFind(0, "Moldura1Traz")>=0) ObjectDelete(0, "Moldura1Traz");
   ObjectCreate(0, "Moldura1Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XSIZE, LarguraMolduraTraz+CorrigirPixels);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YSIZE,Bloco1+4);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YDISTANCE,29+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura1Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BACK, false);
   
   // *** Moldura 1 Frente
   if(ObjectFind(0, "Moldura1Frente")>=0) ObjectDelete(0, "Moldura1Frente");
   ObjectCreate(0, "Moldura1Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XSIZE, LarguraMolduraFrente+CorrigirPixels);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_YSIZE, Bloco1);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_YDISTANCE,31+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BACK, false);
   
   // Lote em Uso
   if(ObjectFind(0, "LoteUso")>=0) ObjectDelete(0, "LoteUso");
   ObjectCreate(0,"LoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteUso",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LoteUso",OBJPROP_TEXT,"Lote em Uso:");
   ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteUso",OBJPROP_YDISTANCE,30+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"LoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteUso",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteUso", OBJPROP_BACK, false);
   
   // Valor Lote em Uso
   if(ObjectFind(0, "ValorLoteUso")>=0) ObjectDelete(0, "ValorLoteUso");
   ObjectCreate(0,"ValorLoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteUso",OBJPROP_FONT, "Arial");         
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,74+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_YDISTANCE,30+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteUso", OBJPROP_BACK, false);

   // Lote Disponivel
   if(ObjectFind(0, "LoteDisponivel")>=0) ObjectDelete(0, "LoteDisponivel");
   ObjectCreate(0,"LoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_YDISTANCE,44+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteDisponivel", OBJPROP_BACK, false);

   // Valor Lote Disponivel         
   if(ObjectFind(0, "ValorLoteDisponivel")>=0) ObjectDelete(0, "ValorLoteDisponivel");
   ObjectCreate(0,"ValorLoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,87+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_YDISTANCE,44+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteDisponivel", OBJPROP_BACK, false);
   
   CalculaLotes();
return(true);
}
   

bool CriaDisplay(){
//+------------------------------------------------------------------+
//| Quadros e Background do Display                                  |
//+------------------------------------------------------------------+ 


   // *** Background
   if(ObjectFind(0, "Rectangle")>=0) ObjectDelete(0, "Rectangle");
   ObjectCreate(0, "Rectangle", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Rectangle", OBJPROP_XSIZE, DisplayLarguraBackgroud+CorrigirPixels);
   ObjectSetInteger(0, "Rectangle", OBJPROP_YSIZE, DisplayAlturaBackgroud);
   ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, 0);
   ObjectSetInteger(0, "Rectangle", OBJPROP_YDISTANCE, 0+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Rectangle", OBJPROP_BGCOLOR, BackgroudColor);
   
   // BOTAO ESCONDER DISPLAY
   if(ObjectFind(0, "EsconderDisplayBtn")>=0) ObjectDelete(0, "EsconderDisplayBtn");   
   ObjectCreate(0,"EsconderDisplayBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "EsconderDisplayBtn", OBJPROP_TEXT,"-");
   ObjectSetString(0,"EsconderDisplayBtn",OBJPROP_FONT, "Arial Black");
   ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XSIZE,22);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_YSIZE,12);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_YDISTANCE,17+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"EsconderDisplayBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0,"EsconderDisplayBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_BORDER_COLOR,C'57,83,108');

   // BOTAO CRIAR MENU SECUNDÁRIO
   if(ObjectFind(0, "MenuSecundarioBtn")>=0) ObjectDelete(0, "MenuSecundarioBtn");   
   ObjectCreate(0,"MenuSecundarioBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "MenuSecundarioBtn", OBJPROP_TEXT,"Menu");
   ObjectSetString(0, "MenuSecundarioBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"MenuSecundarioBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_XSIZE,40);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_YSIZE,11);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_XDISTANCE,125);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_YDISTANCE,4+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0, "MenuSecundarioBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0, "MenuSecundarioBtn",OBJPROP_BORDER_COLOR,C'57,83,108');
   
   // *** Moldura 1 Traz
   if(ObjectFind(0, "Moldura1Traz")>=0) ObjectDelete(0, "Moldura1Traz");
   ObjectCreate(0, "Moldura1Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XSIZE, LarguraMolduraTraz+CorrigirPixels);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YSIZE,Bloco1+4);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YDISTANCE,29+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura1Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BACK, false);
   
   // *** Moldura 1 Frente
   if(ObjectFind(0, "Moldura1Frente")>=0) ObjectDelete(0, "Moldura1Frente");
   ObjectCreate(0, "Moldura1Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XSIZE, LarguraMolduraFrente+CorrigirPixels);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_YSIZE, Bloco1);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_YDISTANCE,31+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BACK, false);
   
   // *** Moldura 2 Traz
   if(ObjectFind(0, "Moldura2Traz")>=0) ObjectDelete(0, "Moldura2Traz");
   ObjectCreate(0, "Moldura2Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XSIZE, LarguraMolduraTraz+CorrigirPixels);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_YSIZE, Bloco2+4);
   ObjectSetInteger(0,"Moldura2Traz", OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"Moldura2Traz", OBJPROP_YDISTANCE,61+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura2Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 2 Frente
   if(ObjectFind(0, "Moldura2Frente")>=0) ObjectDelete(0, "Moldura2Frente");
   ObjectCreate(0, "Moldura2Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XSIZE, LarguraMolduraFrente+CorrigirPixels);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_YSIZE, Bloco2);
   ObjectSetInteger(0,"Moldura2Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura2Frente",OBJPROP_YDISTANCE,63+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura2Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura2Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_BACK, false);  
   
   // *** Moldura 3 Traz
   if(ObjectFind(0, "Moldura3Traz")>=0) ObjectDelete(0, "Moldura3Traz");
   ObjectCreate(0, "Moldura3Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XSIZE, LarguraMolduraTraz+CorrigirPixels);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_YSIZE, Bloco3+4);
   ObjectSetInteger(0,"Moldura3Traz",OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"Moldura3Traz",OBJPROP_YDISTANCE,108+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura3Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 3 Frente
   if(ObjectFind(0, "Moldura3Frente")>=0) ObjectDelete(0, "Moldura3Frente");
   ObjectCreate(0, "Moldura3Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XSIZE, LarguraMolduraFrente+CorrigirPixels);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_YSIZE, Bloco3);
   ObjectSetInteger(0,"Moldura3Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura3Frente",OBJPROP_YDISTANCE,110+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura3Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura3Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_BACK, false); 
   
   // *** Moldura 4 Traz
   if(ObjectFind(0, "Moldura4Traz")>=0) ObjectDelete(0, "Moldura4Traz");
   ObjectCreate(0, "Moldura4Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XSIZE, LarguraMolduraTraz+CorrigirPixels);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_YSIZE, Bloco4+4);
   ObjectSetInteger(0,"Moldura4Traz",OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"Moldura4Traz",OBJPROP_YDISTANCE,154+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_BGCOLOR, BackgroundColorMoldura);
   ObjectSetInteger(0, "Moldura4Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 4 Frente
   if(ObjectFind(0, "Moldura4Frente")>=0) ObjectDelete(0, "Moldura4Frente");
   ObjectCreate(0, "Moldura4Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XSIZE, LarguraMolduraFrente+CorrigirPixels);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_YSIZE, Bloco4);
   ObjectSetInteger(0,"Moldura4Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura4Frente",OBJPROP_YDISTANCE,156+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_BGCOLOR, BackgroudColor);
   ObjectSetInteger(0, "Moldura4Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura4Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_BACK, false); 
   
   // *** Quadro Orientacao
   if(ObjectFind(0, "QuadroOrientacao")>=0) ObjectDelete(0, "QuadroOrientacao");
   ObjectCreate(0, "QuadroOrientacao", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XSIZE, LarguraMolduraTraz-1+CorrigirPixels);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_YSIZE, Bloco5);
   ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_XDISTANCE,3);
   ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_YDISTANCE,239+AbaixarPosicaoDisplay);
   ObjectSetInteger(0, "QuadroOrientacao",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "QuadroOrientacao",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_BACK, false);

//+------------------------------------------------------------------+
//| Dados Apresentados no Display                 |
//+------------------------------------------------------------------+ 

      // *** NomeIndicador
   if(ObjectFind(0, "NomeIndicador")>=0) ObjectDelete(0, "NomeIndicador");
   ObjectCreate(0,"NomeIndicador",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"NomeIndicador",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"NomeIndicador",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"NomeIndicador",OBJPROP_TEXT,IndicatorName+" by Gustavo");
   ObjectSetInteger(0,"NomeIndicador",OBJPROP_XDISTANCE,30);
   ObjectSetInteger(0,"NomeIndicador",OBJPROP_YDISTANCE,15+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"NomeIndicador",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"NomeIndicador",OBJPROP_COLOR,C'179, 204, 204');
   ObjectSetInteger(0, "NomeIndicador", OBJPROP_BACK, false); 
   
   // Lote em Uso
   if(ObjectFind(0, "LoteUso")>=0) ObjectDelete(0, "LoteUso");
   ObjectCreate(0,"LoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteUso",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LoteUso",OBJPROP_TEXT,"Lote em Uso:");
   ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteUso",OBJPROP_YDISTANCE,30+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"LoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteUso",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteUso", OBJPROP_BACK, false);
   
   // Valor Lote em Uso
   if(ObjectFind(0, "ValorLoteUso")>=0) ObjectDelete(0, "ValorLoteUso");
   ObjectCreate(0,"ValorLoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteUso",OBJPROP_FONT, "Arial");         
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,74+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_YDISTANCE,30+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteUso", OBJPROP_BACK, false);
   
   // Lote Disponivel
   if(ObjectFind(0, "LoteDisponivel")>=0) ObjectDelete(0, "LoteDisponivel");
   ObjectCreate(0,"LoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_YDISTANCE,44+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteDisponivel", OBJPROP_BACK, false);

   // Valor Lote Disponivel         
   if(ObjectFind(0, "ValorLoteDisponivel")>=0) ObjectDelete(0, "ValorLoteDisponivel");
   ObjectCreate(0,"ValorLoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,87+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_YDISTANCE,44+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteDisponivel", OBJPROP_BACK, false);

   // Diversificacao Pares Diferentes Operados
   if(ObjectFind(0, "DiversificacaoPares")>=0) ObjectDelete(0, "DiversificacaoPares");
   ObjectCreate(0,"DiversificacaoPares",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"DiversificacaoPares",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"DiversificacaoPares",OBJPROP_TEXT,"Diversificação:");
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_YDISTANCE,63+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "DiversificacaoPares", OBJPROP_BACK, false);
   
   // Valor Diversificacao Pares Diferentes Operados
   if(ObjectFind(0, "ValorDiversificacaoPares")>=0) ObjectDelete(0, "ValorDiversificacaoPares");
   ObjectCreate(0,"ValorDiversificacaoPares",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorDiversificacaoPares",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_XDISTANCE,82+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_YDISTANCE,63+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorDiversificacaoPares", OBJPROP_BACK, false);
  
   // Operações nesse Par
   if(ObjectFind(0, "QtdPosicaoAberta")>=0) ObjectDelete(0, "QtdPosicaoAberta");
   ObjectCreate(0,"QtdPosicaoAberta",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"QtdPosicaoAberta",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"QtdPosicaoAberta",OBJPROP_TEXT,"Operações nesse Par:");
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_YDISTANCE,77+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "QtdPosicaoAberta", OBJPROP_BACK, false);
   
   // Valor Quantidade de Posicoes Abertas nesse Par
   if(ObjectFind(0, "ValorQtdPosicaoAberta")>=0) ObjectDelete(0, "ValorQtdPosicaoAberta");
   ObjectCreate(0,"ValorQtdPosicaoAberta",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorQtdPosicaoAberta",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_XDISTANCE,120+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_YDISTANCE,77+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorQtdPosicaoAberta", OBJPROP_BACK, false);         
   
   // Lotes Operados nesse Par
   if(ObjectFind(0, "LotesOperadosNoPar")>=0) ObjectDelete(0, "LotesOperadosNoPar");
   ObjectCreate(0,"LotesOperadosNoPar",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LotesOperadosNoPar",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LotesOperadosNoPar",OBJPROP_TEXT,"Lotes nesse Par:");
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_YDISTANCE,90+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LotesOperadosNoPar", OBJPROP_BACK, false);
   
   // Valor Lotes Operados nesse Par
   if(ObjectFind(0, "ValorLotesOperadosNoPar")>=0) ObjectDelete(0, "ValorLotesOperadosNoPar");
   ObjectCreate(0,"ValorLotesOperadosNoPar",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLotesOperadosNoPar",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,94+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_YDISTANCE,90+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorLotesOperadosNoPar", OBJPROP_BACK, false);         
  
   // Distancia da Mediana
   if(ObjectFind(0, "DistanciaMediana")>=0) ObjectDelete(0, "DistanciaMediana");
   ObjectCreate(0,"DistanciaMediana",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"DistanciaMediana",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_YDISTANCE,110+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "DistanciaMediana", OBJPROP_BACK, false);
   
   // Valor Distancia Mediana
   if(ObjectFind(0, "ValorDistanciaMediana")>=0) ObjectDelete(0, "ValorDistanciaMediana");
   ObjectCreate(0,"ValorDistanciaMediana",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorDistanciaMediana",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,PosicaoDistanciaMediana+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_YDISTANCE,110+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorDistanciaMediana", OBJPROP_BACK, false);                  

   // Media Pontos Diario
   if(ObjectFind(0, "MediaMovDiario")>=0) ObjectDelete(0, "MediaMovDiario");
   ObjectCreate(0,"MediaMovDiario",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"MediaMovDiario",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"MediaMovDiario",OBJPROP_TEXT,"Mov. Média Diária:");
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_YDISTANCE,123+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"MediaMovDiario",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "MediaMovDiario", OBJPROP_BACK, false);
   
   // Valor Media Pontos Diario
   if(ObjectFind(0, "ValorMediaMovDiario")>=0) ObjectDelete(0, "ValorMediaMovDiario");
   ObjectCreate(0,"ValorMediaMovDiario",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorMediaMovDiario",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_XDISTANCE,100+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_YDISTANCE,123+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorMediaMovDiario", OBJPROP_BACK, false);

   // Movimentacao do Par
   if(ObjectFind(0, "MovimentacaoParHoje")>=0) ObjectDelete(0, "MovimentacaoParHoje");
   ObjectCreate(0,"MovimentacaoParHoje",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"MovimentacaoParHoje",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"MovimentacaoParHoje",OBJPROP_TEXT, "Mov. Hoje:");
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_YDISTANCE,136+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "MovimentacaoParHoje", OBJPROP_BACK, false);
   
   // Valor Movimentacao do Par
   if(ObjectFind(0, "ValorMovimentacaoParHoje")>=0) ObjectDelete(0, "ValorMovimentacaoParHoje");
   ObjectCreate(0,"ValorMovimentacaoParHoje",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorMovimentacaoParHoje",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_XDISTANCE,57+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_YDISTANCE,136+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorMovimentacaoParHoje", OBJPROP_BACK, false);

   // Lucro Ponto Por Lote
   if(ObjectFind(0, "LucroPontoPorLote")>=0) ObjectDelete(0, "LucroPontoPorLote");
   ObjectCreate(0,"LucroPontoPorLote",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LucroPontoPorLote",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LucroPontoPorLote",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LucroPontoPorLote",OBJPROP_TEXT,"Lucro Ponto(Lote1.0):");
   ObjectSetInteger(0,"LucroPontoPorLote",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LucroPontoPorLote",OBJPROP_YDISTANCE,156+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"LucroPontoPorLote",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LucroPontoPorLote",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LucroPontoPorLote", OBJPROP_BACK, false);

   // Valor Lucro Ponto Por Lote
   if(ObjectFind(0, "ValorLucroPontoPorLote")>=0) ObjectDelete(0, "ValorLucroPontoPorLote");
   ObjectCreate(0,"ValorLucroPontoPorLote",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLucroPontoPorLote",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLucroPontoPorLote",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLucroPontoPorLote",OBJPROP_XDISTANCE,118+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorLucroPontoPorLote",OBJPROP_YDISTANCE,156+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorLucroPontoPorLote",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorLucroPontoPorLote",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorLucroPontoPorLote", OBJPROP_BACK, false);
         
   // Swap Compra
   if(ObjectFind(0, "SwapCompra")>=0) ObjectDelete(0, "SwapCompra");
   ObjectCreate(0,"SwapCompra",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"SwapCompra",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"SwapCompra",OBJPROP_TEXT,"Swap Compra:");
   ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_YDISTANCE,169+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "SwapCompra", OBJPROP_BACK, false);
   
   // Valor Swap Compra
   if(ObjectFind(0, "ValorSwapCompra")>=0) ObjectDelete(0, "ValorSwapCompra");
   ObjectCreate(0,"ValorSwapCompra",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSwapCompra",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,83+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_YDISTANCE,169+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSwapCompra", OBJPROP_BACK, false);
   
   // Swap Venda
   if(ObjectFind(0, "SwapVenda")>=0) ObjectDelete(0, "SwapVenda");
   ObjectCreate(0,"SwapVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"SwapVenda",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"SwapVenda",OBJPROP_TEXT,"Swap Venda:");
   ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_YDISTANCE,182+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "SwapVenda", OBJPROP_BACK, false);
   
   // Valor Swap Venda
   if(ObjectFind(0, "ValorSwapVenda")>=0) ObjectDelete(0, "ValorSwapVenda");
   ObjectCreate(0,"ValorSwapVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSwapVenda",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,78+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_YDISTANCE,182+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSwapVenda", OBJPROP_BACK, false);
   
   // Spread
   if(ObjectFind(0, "Spread")>=0) ObjectDelete(0, "Spread");
   ObjectCreate(0,"Spread",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"Spread",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"Spread",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"Spread",OBJPROP_TEXT,"Spread:");
   ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"Spread",OBJPROP_YDISTANCE,195+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"Spread",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"Spread",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "Spread", OBJPROP_BACK, false);
   
   // Valor Spread     
   if(ObjectFind(0, "ValorSpread")>=0) ObjectDelete(0, "ValorSpread");
   ObjectCreate(0,"ValorSpread",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSpread",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,52+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_YDISTANCE,195+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSpread", OBJPROP_BACK, false);

   // Nivel de Margem
   if(ObjectFind(0, "NiveldeMargem")>=0) ObjectDelete(0, "NiveldeMargem");
   ObjectCreate(0,"NiveldeMargem",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"NiveldeMargem",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"NiveldeMargem",OBJPROP_TEXT,"Nivel de Margem:");
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_YDISTANCE,208+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"NiveldeMargem",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "NiveldeMargem", OBJPROP_BACK, false);
   
   // Valor Nivel de Margem     
   if(ObjectFind(0, "ValorNiveldeMargem")>=0) ObjectDelete(0, "ValorNiveldeMargem");
   ObjectCreate(0,"ValorNiveldeMargem",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorNiveldeMargem",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_XDISTANCE,91+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_YDISTANCE,208+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorNiveldeMargem", OBJPROP_BACK, false);

   // DrawDown
   if(ObjectFind(0, "DrawDown")>=0) ObjectDelete(0, "DrawDown");
   ObjectCreate(0,"DrawDown",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DrawDown",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"DrawDown",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"DrawDown",OBJPROP_TEXT,"DrawDown:");
   ObjectSetInteger(0,"DrawDown",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"DrawDown",OBJPROP_YDISTANCE,221+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"DrawDown",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DrawDown",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "DrawDown", OBJPROP_BACK, false);
   
   // Valor DrawDown     
   if(ObjectFind(0, "ValorDrawDown")>=0) ObjectDelete(0, "ValorDrawDown");
   ObjectCreate(0,"ValorDrawDown",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorDrawDown",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorDrawDown",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorDrawDown",OBJPROP_XDISTANCE,75+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"ValorDrawDown",OBJPROP_YDISTANCE,221+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"ValorDrawDown",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorDrawDown",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorDrawDown", OBJPROP_BACK, false);
   
   // Topo ou Fundo
   if(ObjectFind(0, "OrientacaoTopoFundo")>=0) ObjectDelete(0, "OrientacaoTopoFundo");
   ObjectCreate(0,"OrientacaoTopoFundo",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"OrientacaoTopoFundo",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,FontePaddingLeft+2);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_YDISTANCE,245+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "OrientacaoTopoFundo", OBJPROP_BACK, false);
   
   // Orientacao Compra, Vende ou Aguarda
   if(ObjectFind(0, "OrientacaoCompraVenda")>=0) ObjectDelete(0, "OrientacaoCompraVenda");  
   ObjectCreate(0,"OrientacaoCompraVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_FONTSIZE,FonteBase2);
   ObjectSetString(0,"OrientacaoCompraVenda",OBJPROP_FONT, "Arial Black");
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,70+CorrigirPixels-CorrigirPixelsValor);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_YDISTANCE,244+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "OrientacaoCompraVenda", OBJPROP_BACK, false);
     
   // Nome do Ativo Operado
   if(ObjectFind(0, "DisplayAtivoOperado")>=0) ObjectDelete(0, "DisplayAtivoOperado");
   ObjectCreate(0,"DisplayAtivoOperado",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_FONTSIZE,FonteBase1+3);
   ObjectSetString(0,"DisplayAtivoOperado",OBJPROP_FONT, "Arial Black");
   ObjectSetString(0,"DisplayAtivoOperado",OBJPROP_TEXT,"Ativo: "+Symbol());
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_XDISTANCE,20);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_YDISTANCE,263+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_COLOR,clrOrange);
   ObjectSetInteger(0, "DisplayAtivoOperado", OBJPROP_BACK, false);
    
      // *** Creditos
   if(ObjectFind(0, "CreditosGratuito")>=0) ObjectDelete(0, "CreditosGratuito");
   ObjectCreate(0,"CreditosGratuito",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"CreditosGratuito",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"CreditosGratuito",OBJPROP_FONT, "Arial Black");
   ObjectSetString(0,"CreditosGratuito",OBJPROP_TEXT,"Indicador GRATUITO "+VERSION);
   ObjectSetInteger(0,"CreditosGratuito",OBJPROP_XDISTANCE,5);
   ObjectSetInteger(0,"CreditosGratuito",OBJPROP_YDISTANCE,298+AbaixarPosicaoDisplay);
   ObjectSetInteger(0,"CreditosGratuito",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"CreditosGratuito",OBJPROP_COLOR,C'230, 230, 0');
   ObjectSetInteger(0, "CreditosGratuito", OBJPROP_BACK, false); 

//+------------------------------------------------------------------+
//| Tamanho para redimensionar o Display                 |
//+------------------------------------------------------------------+ 
   int Item1DistanciaEsquerdaTam2 = 0;
   if(TamanhoDisplay == 2)
     {
     int AumentoQuadroAltura = 20;
     int AumentoQuadroLargura = 37;
     int FonteAumento = 2;
     Item1DistanciaEsquerdaTam2 = 0;
     int Item2DistanciaDireitaTam2 = 27;
     int FonteDistanciaY = 3;
     
                
      ObjectSetInteger(0,"LoteUso",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"LoteUso",OBJPROP_YDISTANCE,27+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,74+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_YDISTANCE,27+FonteDistanciaY);
      
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_YDISTANCE,41+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,PosicaoDistanciaMediana+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_YDISTANCE,41+FonteDistanciaY); 
      
      ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_YDISTANCE,63+FonteDistanciaY);

      ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_XDISTANCE,81+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_YDISTANCE,63+FonteDistanciaY);

      ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_YDISTANCE,78+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_XDISTANCE,120+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_YDISTANCE,78+FonteDistanciaY); 
      
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_YDISTANCE,92+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,94+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_YDISTANCE,92+FonteDistanciaY);

      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_YDISTANCE,116+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,81+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_YDISTANCE,116+FonteDistanciaY);
      
      ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_YDISTANCE,131+FonteDistanciaY);

      ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_XDISTANCE,50+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_YDISTANCE,131+FonteDistanciaY);

      ObjectSetInteger(0,"MediaMovDiario",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"MediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"MediaMovDiario",OBJPROP_YDISTANCE,147+FonteDistanciaY);

      ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_XDISTANCE,50+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_YDISTANCE,147+FonteDistanciaY);

      ObjectSetInteger(0,"SwapCompra",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"SwapCompra",OBJPROP_YDISTANCE,171+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,83+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_YDISTANCE,171+FonteDistanciaY);
      
      ObjectSetInteger(0,"SwapVenda",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"SwapVenda",OBJPROP_YDISTANCE,187+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,78+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_YDISTANCE,187+FonteDistanciaY);
      
      ObjectSetInteger(0,"Spread",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"Spread",OBJPROP_YDISTANCE,202+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSpread",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,52+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorSpread",OBJPROP_YDISTANCE,202+FonteDistanciaY);

      ObjectSetInteger(0,"NiveldeMargem",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"NiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"NiveldeMargem",OBJPROP_YDISTANCE,218+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_XDISTANCE,82+Item2DistanciaDireitaTam2);
      ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_YDISTANCE,218+FonteDistanciaY);
      
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_FONTSIZE,FonteBase2+FonteAumento);
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,10+FontePaddingLeft+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_YDISTANCE,222+AumentoQuadroAltura+FonteDistanciaY);
      
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_FONTSIZE,FonteBase2+FonteAumento);
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,70+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_YDISTANCE,220+AumentoQuadroAltura+FonteDistanciaY);   
      
      ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_FONTSIZE,FonteBase1+FonteAumento-1);
      ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_XDISTANCE,8+Item1DistanciaEsquerdaTam2);
      ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_YDISTANCE,13);                       
   
      ObjectSetInteger(0, "Rectangle", OBJPROP_XSIZE, 145+AumentoQuadroLargura);
      ObjectSetInteger(0, "Rectangle", OBJPROP_YSIZE, 239+AumentoQuadroAltura);           
      ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, 0);
      ObjectSetInteger(0, "Rectangle", OBJPROP_YDISTANCE, 13);
      //botao
      ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+AumentoQuadroLargura);
      ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+AumentoQuadroLargura+22); 
                
      ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YSIZE, 35);
      ObjectSetInteger(0, "Moldura1Traz",OBJPROP_YDISTANCE,28);           
      
      ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura1Frente", OBJPROP_YSIZE, 11+AumentoQuadroAltura);
      ObjectSetInteger(0, "Moldura1Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0, "Moldura1Frente",OBJPROP_YDISTANCE,30);           
      
      ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura2Traz", OBJPROP_YSIZE, 30+AumentoQuadroAltura);
      ObjectSetInteger(0, "Moldura2Traz",OBJPROP_YDISTANCE,64);
      
      ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura2Frente", OBJPROP_YSIZE, 26+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura2Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura2Frente",OBJPROP_YDISTANCE,66);           
      
      ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura3Traz", OBJPROP_YSIZE, 35+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura3Traz",OBJPROP_YDISTANCE,115);
        
      ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura3Frente", OBJPROP_YSIZE, 31+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura3Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura3Frente",OBJPROP_YDISTANCE,117);           
                  
      ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura4Traz", OBJPROP_YSIZE, 49+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura4Traz",OBJPROP_YDISTANCE,171);
      
      ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XSIZE, 135+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura4Frente", OBJPROP_YSIZE, 45+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura4Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura4Frente",OBJPROP_YDISTANCE,173);
   
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_YSIZE, 9+AumentoQuadroAltura);
      ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_YDISTANCE,241);
      
      ObjectSetInteger(0, "CreditosGratuito", OBJPROP_YDISTANCE, 269);
      
     }
    else if(TamanhoDisplay == 3)
     {
      
     }
    else if(TamanhoDisplay == 4)
     {
      
     }
     

//+------------------------------------------------------------------+
//| Localização Painel                 |
//+------------------------------------------------------------------+
// Canto Esquerdo Superior  
if(LocalizacaoDisplay == 2)
  {         
         // botao lado esquerdo
         ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         //lado direito com tamanho maior
         ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_CORNER,CORNER_LEFT_UPPER); 
         if(TamanhoDisplay == 2)
           {
            ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,140);
            ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,162); 
           }
         
         ObjectSetInteger(0,"Rectangle",OBJPROP_CORNER,CORNER_LEFT_UPPER);        
         ObjectSetInteger(0,"Moldura1Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura1Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
              
         ObjectSetInteger(0,"Moldura2Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura2Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura3Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura3Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura4Traz",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"Moldura4Frente",OBJPROP_CORNER,CORNER_LEFT_UPPER);
         
         ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_CORNER,CORNER_LEFT_UPPER);   
  }
// Canto Direito Superior     
      if(LocalizacaoDisplay == 4)
       {
       int Item1e2DistanciaDireita = 141;
       int Item2DistanciaDireita = 4;
       int PaddinBtnRight = 21;
       int EspacamentoTamanho2 = 0;
          //modificacoes canto direito com tamanho maior
          if(TamanhoDisplay == 2)
            {
             LarguraMolduraTraz = LarguraMolduraTraz+31;
             LarguraMolduraFrente = LarguraMolduraFrente+31;
             Item1e2DistanciaDireita = Item1e2DistanciaDireita+32;
             Item2DistanciaDireita = Item2DistanciaDireita+19;
             PaddinBtnRight = 22;
             EspacamentoTamanho2 = 35;
            }
         ObjectSetInteger(0,"Rectangle",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, DisplayLarguraBackgroud+EspacamentoTamanho2);
         
         // botao lado direito
         ObjectSetInteger(0,"EsconderDisplayBtn",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "EsconderDisplayBtn", OBJPROP_XDISTANCE,PaddinBtnRight);
         // botao mostrar pares principais
         ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,PaddinBtnRight+22);
         ObjectSetString(0, "DisplayParesBtn", OBJPROP_TEXT,"<");
         
         ObjectSetInteger(0,"Moldura1Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura1Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
              
         ObjectSetInteger(0,"Moldura2Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura2Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
         
         ObjectSetInteger(0,"Moldura3Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura3Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
         
         ObjectSetInteger(0,"Moldura4Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);
         
         ObjectSetInteger(0,"Moldura4Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+8);
         
         ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XDISTANCE, LarguraMolduraTraz+6);   
         
         ObjectSetInteger(0,"CreditosGratuito",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "CreditosGratuito", OBJPROP_XDISTANCE, LarguraMolduraTraz);     
                        
         // textos ancoragem         
         ObjectSetInteger(0,"LoteUso",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"DistanciaMediana",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"MediaMovDiario",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"SwapCompra",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"SwapVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"Spread",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSpread",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"NiveldeMargem",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         // ajuste textos         
         ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,64+Item2DistanciaDireita);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,57+Item2DistanciaDireita);
         ObjectSetInteger(0,"QtdPosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorQtdPosicaoAberta",OBJPROP_XDISTANCE,25+Item2DistanciaDireita);
         ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,50+Item2DistanciaDireita);
         ObjectSetInteger(0,"DiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorDiversificacaoPares",OBJPROP_XDISTANCE,FontePaddingLeft+54+Item2DistanciaDireita);         
         ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+51+Item2DistanciaDireita);
         ObjectSetInteger(0,"MovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorMovimentacaoParHoje",OBJPROP_XDISTANCE,FontePaddingLeft+79+Item2DistanciaDireita);
         ObjectSetInteger(0,"MediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorMediaMovDiario",OBJPROP_XDISTANCE,FontePaddingLeft+80+Item2DistanciaDireita);    
         ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,63+Item2DistanciaDireita);
         ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,68+Item2DistanciaDireita);
         ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,92+Item2DistanciaDireita);
         ObjectSetInteger(0,"NiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"ValorNiveldeMargem",OBJPROP_XDISTANCE,FontePaddingLeft+46+Item2DistanciaDireita);         
         ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,FontePaddingLeft+Item1e2DistanciaDireita);
         ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,80+Item1DistanciaEsquerdaTam2+Item2DistanciaDireita+PaddinBtnRight);
         ObjectSetInteger(0,"DisplayAtivoOperado",OBJPROP_XDISTANCE,8+Item1e2DistanciaDireita);
       }
       
   if(AlertaLucroEscolha>0)
     {
      // Icone de Notificação de Lucro
      if(ObjectFind(0, "NotificaçãoLigada")>=0) ObjectDelete(0, "NotificaçãoLigada");
      ObjectCreate(0,"NotificaçãoLigada",OBJ_LABEL,0,0,0,0,0,0,0);
      ObjectSetInteger(0,"NotificaçãoLigada",OBJPROP_FONTSIZE,"17");
      ObjectSetString(0,"NotificaçãoLigada",OBJPROP_FONT, "Arial");
      ObjectSetString(0,"NotificaçãoLigada",OBJPROP_TEXT,"🕪");
      ObjectSetInteger(0,"NotificaçãoLigada",OBJPROP_XDISTANCE,3);
      ObjectSetInteger(0,"NotificaçãoLigada",OBJPROP_YDISTANCE,25);
      ObjectSetInteger(0,"NotificaçãoLigada",OBJPROP_CORNER,CORNER_LEFT_LOWER);
      ObjectSetInteger(0,"NotificaçãoLigada",OBJPROP_COLOR,clrGainsboro);
      ObjectSetInteger(0, "NotificaçãoLigada", OBJPROP_BACK, false);      
     }


       
ChartRedraw();
return(true);
}


bool CriaLinhasHistoricas(){
//+------------------------------------------------------------------+
//| Linhas desenhadas no grafico                                     |
//+------------------------------------------------------------------+ 
     
   // Linha do Topo
   if(ObjectFind(0, "LinhaTopoHistorico")>=0) ObjectDelete(0, "LinhaTopoHistorico");
   ObjectCreate(0,"LinhaTopoHistorico",OBJ_HLINE,0,0,Topo);
   ObjectSetInteger(0,"LinhaTopoHistorico",OBJPROP_COLOR,clrDodgerBlue);         
   // Linha da Mediana
   if(ObjectFind(0, "LinhaMediana")>=0) ObjectDelete(0, "LinhaMediana");
   ObjectCreate(0,"LinhaMediana",OBJ_HLINE,0,0,Mediana);         
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_COLOR,clrGold);
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_STYLE,STYLE_DASH);
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_WIDTH,2);
   // Linha do Fundo
   if(ObjectFind(0, "LinhaFundoHistorico")>=0) ObjectDelete(0, "LinhaFundoHistorico");
   ObjectCreate(0,"LinhaFundoHistorico",OBJ_HLINE,0,0,Fundo);         
   ObjectSetInteger(0,"LinhaFundoHistorico",OBJPROP_COLOR,clrSalmon);
   // Linha do Preço Médio Ultimos anos
   double PrecoMedio = CalculaPrecoMedio(_Symbol, "meses", MesesHistoricos);
   if(ObjectFind(0, "LinhaPrecoMedioAnos")>=0) ObjectDelete(0, "LinhaPrecoMedioAnos");
   ObjectCreate(0,"LinhaPrecoMedioAnos",OBJ_HLINE,0,0,PrecoMedio);         
   ObjectSetInteger(0,"LinhaPrecoMedioAnos",OBJPROP_COLOR,clrDarkTurquoise);
   
   //Texto das linhas
   //Topo Historico Label
   if(ObjectFind(0, "TopoLabel")>=0) ObjectDelete(0, "TopoLabel");
   ObjectCreate(0,"TopoLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+2) + "." + IntegerToString(Tempo.day),Topo);
   ObjectSetString(0, "TopoLabel", OBJPROP_TEXT, "Topo "+(MesesHistoricos/12)+" anos");
   ObjectSetString(0,"TopoLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"TopoLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"TopoLabel",OBJPROP_COLOR,clrDodgerBlue);
   //Mediana Label
   if(ObjectFind(0, "MedianaLabel")>=0) ObjectDelete(0, "MedianaLabel");
   ObjectCreate(0,"MedianaLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+7) + "." + IntegerToString(Tempo.day),Mediana);
   ObjectSetString(0, "MedianaLabel", OBJPROP_TEXT, "Mediana");
   ObjectSetString(0,"MedianaLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"MedianaLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"MedianaLabel",OBJPROP_COLOR,clrGold);
   //Fundo Historico Label
   if(ObjectFind(0, "FundoLabel")>=0) ObjectDelete(0, "FundoLabel");
   ObjectCreate(0,"FundoLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+2) + "." + IntegerToString(Tempo.day),Fundo);
   ObjectSetString(0, "FundoLabel", OBJPROP_TEXT, "Fundo "+(MesesHistoricos/12)+" anos");
   ObjectSetString(0,"FundoLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"FundoLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"FundoLabel",OBJPROP_COLOR,clrSalmon);
   //Preco atual Label
   if(ObjectFind(0, "PrecoMedioAnosLabel")>=0) ObjectDelete(0, "PrecoMedioAnosLabel");
   ObjectCreate(0,"PrecoMedioAnosLabel",OBJ_TEXT,0,IntegerToString(Tempo.year) + "." + IntegerToString(Tempo.mon+2) + "." + IntegerToString(Tempo.day),PrecoMedio);
   ObjectSetString(0, "PrecoMedioAnosLabel", OBJPROP_TEXT, "Preço Médio "+(MesesHistoricos/12)+" anos");
   ObjectSetString(0,"PrecoMedioAnosLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"PrecoMedioAnosLabel",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0,"PrecoMedioAnosLabel",OBJPROP_COLOR,clrDarkTurquoise);   

   // Esconde as Labels
   if(!titulo_TopoMedianaFundo)
     {
      ObjectSetString(0,"TopoLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"MedianaLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"FundoLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"PrecoMedioAnosLabel",OBJPROP_TEXT," ");
     }

   // Esconde apenas Label Preço atual
   if(!mostrarPrecoMedio)
     {
      ObjectSetString(0,"PrecoMedioAnosLabel",OBJPROP_TEXT," ");
      ObjectDelete(0, "LinhaPrecoMedioAnos");   
     }
   return(true);   
}

// menu que é chamado ao clicar Painel
bool CriaMenuSecundarioPainel()
   {
   int TamMenuPares = 60;
   int TamMenuForca = 40;
   int TamMenuEconomicos = 106;
   int TamMenuOperacoes = 106;
   int TamMenuExposicao = 60;
   int TamMenuPrecos = 75;
   int TamMenuCustom = 60;   
   int TamEspacamento = 11;
   int TamMenuSecundario = TamMenuPares+TamMenuForca+TamMenuEconomicos+TamMenuOperacoes+TamMenuExposicao+TamMenuPrecos+TamMenuCustom+TamEspacamento*8;
   
   
   int CorrigirPixelsValor = 0;
   if(CorrigirPixels != 0) CorrigirPixelsValor = CorrigirPixels - CorrigirPixels/5;
   
   // *** Fundo Menu Secundario dos Paineis
   if(ObjectFind(0, "FundoMenuSecundario")>=0) ObjectDelete(0, "FundoMenuSecundario");
   ObjectCreate(0, "FundoMenuSecundario", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "FundoMenuSecundario", OBJPROP_XSIZE, TamMenuSecundario);
   ObjectSetInteger(0, "FundoMenuSecundario", OBJPROP_YSIZE, 26);
   ObjectSetInteger(0, "FundoMenuSecundario", OBJPROP_XDISTANCE, DisplayLarguraBackgroud+CorrigirPixels);
   ObjectSetInteger(0, "FundoMenuSecundario", OBJPROP_YDISTANCE, 0);
   ObjectSetInteger(0, "FundoMenuSecundario", OBJPROP_BGCOLOR, C'36,46,65');

   // BOTAO CRIAR DISPLAY PARES
   if(ObjectFind(0, "DisplayParesBtn")>=0) ObjectDelete(0, "DisplayParesBtn");   
   ObjectCreate(0,"DisplayParesBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayParesBtn", OBJPROP_TEXT,"Principais");
   ObjectSetString(0, "DisplayParesBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayParesBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XSIZE,TamMenuPares);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+CorrigirPixels+TamEspacamento);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_YDISTANCE,5);
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_BGCOLOR,C'0, 128, 43');
   ObjectSetInteger(0, "DisplayParesBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0, "DisplayParesBtn",OBJPROP_BORDER_COLOR,C'0, 102, 0');

   // BOTAO FORÇA PARES
   if(ObjectFind(0, "DisplayForcaMoedaBtn")>=0) ObjectDelete(0, "DisplayForcaMoedaBtn");   
   ObjectCreate(0,"DisplayForcaMoedaBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayForcaMoedaBtn", OBJPROP_TEXT,"Força");
   ObjectSetString(0, "DisplayForcaMoedaBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayForcaMoedaBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_XSIZE,TamMenuForca);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+CorrigirPixels+TamMenuPares+TamEspacamento*2);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_YDISTANCE,5);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_BGCOLOR,clrFireBrick);
   ObjectSetInteger(0, "DisplayForcaMoedaBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0, "DisplayForcaMoedaBtn",OBJPROP_BORDER_COLOR,clrMaroon); 

   // BOTAO CRIAR DISPLAY PARES CUSTOM
   if(ObjectFind(0, "DisplayParesCustomBtn")>=0) ObjectDelete(0, "DisplayParesCustomBtn");   
   ObjectCreate(0, "DisplayParesCustomBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayParesCustomBtn", OBJPROP_TEXT,"P.Editável");
   ObjectSetString(0, "DisplayParesCustomBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayParesCustomBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_XSIZE,TamMenuCustom);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+CorrigirPixels+TamMenuPares+TamMenuForca+TamEspacamento*3);
   ObjectSetInteger(0, "DisplayParesCustomBtn", OBJPROP_YDISTANCE,5);
   ObjectSetInteger(0,"DisplayParesCustomBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0,"DisplayParesCustomBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"DisplayParesCustomBtn",OBJPROP_BORDER_COLOR,C'57,83,108');

   // BOTAO PAINEL OPERAÇÕES ABERTAS
   if(ObjectFind(0, "OperacoesAbertasBtn")>=0) ObjectDelete(0, "OperacoesAbertasBtn");   
   ObjectCreate(0, "OperacoesAbertasBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "OperacoesAbertasBtn", OBJPROP_TEXT,"Operações Abertas");
   ObjectSetString(0, "OperacoesAbertasBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"OperacoesAbertasBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "OperacoesAbertasBtn", OBJPROP_XSIZE,TamMenuOperacoes);
   ObjectSetInteger(0, "OperacoesAbertasBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "OperacoesAbertasBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+CorrigirPixels+TamMenuPares+TamMenuForca+TamMenuCustom+TamEspacamento*4);
   ObjectSetInteger(0, "OperacoesAbertasBtn", OBJPROP_YDISTANCE,5);
   ObjectSetInteger(0, "OperacoesAbertasBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0, "OperacoesAbertasBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0, "OperacoesAbertasBtn",OBJPROP_BORDER_COLOR,C'57,83,108'); 

   // BOTAO CRIAR DISPLAY DADOS ECONOMICOS
   if(ObjectFind(0, "DisplayDadosEconomicosBtn")>=0) ObjectDelete(0, "DisplayDadosEconomicosBtn");   
   ObjectCreate(0, "DisplayDadosEconomicosBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayDadosEconomicosBtn", OBJPROP_TEXT,"Dados Econômicos");
   ObjectSetString(0, "DisplayDadosEconomicosBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayDadosEconomicosBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayDadosEconomicosBtn", OBJPROP_XSIZE,TamMenuEconomicos);
   ObjectSetInteger(0, "DisplayDadosEconomicosBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "DisplayDadosEconomicosBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+CorrigirPixels+TamMenuPares+TamMenuForca+TamMenuCustom+TamMenuOperacoes+TamEspacamento*5);
   ObjectSetInteger(0, "DisplayDadosEconomicosBtn", OBJPROP_YDISTANCE,5);
   ObjectSetInteger(0,"DisplayDadosEconomicosBtn", OBJPROP_BGCOLOR,clrMediumBlue);
   ObjectSetInteger(0,"DisplayDadosEconomicosBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"DisplayDadosEconomicosBtn",OBJPROP_BORDER_COLOR,C'0, 0, 204');

   // BOTAO GRAFITO EXPOSIÇÃO MOEDAS
   if(ObjectFind(0, "ExposicaoMoedasBtn")>=0) ObjectDelete(0, "ExposicaoMoedasBtn");   
   ObjectCreate(0, "ExposicaoMoedasBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "ExposicaoMoedasBtn", OBJPROP_TEXT,"Exposição");
   ObjectSetString(0, "ExposicaoMoedasBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"ExposicaoMoedasBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "ExposicaoMoedasBtn", OBJPROP_XSIZE,TamMenuExposicao);
   ObjectSetInteger(0, "ExposicaoMoedasBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "ExposicaoMoedasBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+CorrigirPixels+TamMenuPares+TamMenuForca+TamMenuCustom+TamMenuOperacoes+TamMenuEconomicos+TamEspacamento*6);
   ObjectSetInteger(0, "ExposicaoMoedasBtn", OBJPROP_YDISTANCE,5);
   ObjectSetInteger(0,"ExposicaoMoedasBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0,"ExposicaoMoedasBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"ExposicaoMoedasBtn",OBJPROP_BORDER_COLOR,C'57,83,108'); 
   
   // BOTAO CRIAR DISPLAY PRECOS
   if(ObjectFind(0, "DisplayParesPrecosBtn")>=0) ObjectDelete(0, "DisplayParesPrecosBtn");   
   ObjectCreate(0, "DisplayParesPrecosBtn", OBJ_BUTTON,0,0,0);
   ObjectSetString(0, "DisplayParesPrecosBtn", OBJPROP_TEXT,"Preço Ativos");
   ObjectSetString(0, "DisplayParesPrecosBtn",OBJPROP_FONT, "Verdana");
   ObjectSetInteger(0,"DisplayParesPrecosBtn",OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0, "DisplayParesPrecosBtn", OBJPROP_XSIZE,TamMenuPrecos);
   ObjectSetInteger(0, "DisplayParesPrecosBtn", OBJPROP_YSIZE,13);
   ObjectSetInteger(0, "DisplayParesPrecosBtn", OBJPROP_XDISTANCE,DisplayLarguraBackgroud+CorrigirPixels+TamMenuPares+TamMenuForca+TamMenuCustom+TamMenuOperacoes+TamMenuEconomicos+TamMenuExposicao+TamEspacamento*7);
   ObjectSetInteger(0, "DisplayParesPrecosBtn", OBJPROP_YDISTANCE,5);
   ObjectSetInteger(0,"DisplayParesPrecosBtn", OBJPROP_BGCOLOR,C'57,83,108');
   ObjectSetInteger(0,"DisplayParesPrecosBtn", OBJPROP_COLOR,clrSnow); 
   ObjectSetInteger(0,"DisplayParesPrecosBtn",OBJPROP_BORDER_COLOR,C'57,83,108');  
      



 

return(true); 
}
