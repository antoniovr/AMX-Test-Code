PROGRAM_NAME='test'

DEFINE_DEVICE 

    dvTp = 10001:1:0
    vdvSystem = 33000:1:0


#include 'EarAPI.axi'

DEFINE_CONSTANT

    // Id del timeline, única por cada bloque de código cerrado
    volatile long _TLID = 1

DEFINE_VARIABLE

    // Definimos los tiempos de los que está compuesto nuestro timeline
    volatile long lTimes[] = {500} // Actualiza el feedback cada 1/2 segundo

    volatile integer anCanales[] = {1,2,3,4,5,6}

DEFINE_START

    /*
	Argumentos
	1 - ID del timeline, debe ser un long
	2 - Tiempos de los que está compuesto el timeline
	3 - Elegir entre:
	    * timeline_relative: cada tiempo definido es a partir del tiempo anterior
	    * timeline_absolute: cada tiempo definido es a partir del inicio del timeline
	4 - Elegir entre:
	    * timeline_once: el TL se ejecuta una única vez
	    * timeline_repeat: el timeline 
    */
    timeline_create(_TLID,lTimes,1,timeline_relative,timeline_repeat)

DEFINE_EVENT

    timeline_event[_TLID]
    {
	// Entrará aquí cada 1/2 segundo
    }
	
    channel_event[vdvSystem,anCanales]
    {
	on:
	{
	    stack_var integer nCanalActivado
	    nCanalActivado = get_last(anCanales)
	    switch(nCanalActivado)
	    {
		case 1: 
		{
		    
		}
		case 2:
		{
		
		}
		case 3:
		{
		
		}
		case 4:
		{
		
		}
		case 5:
		{
		
		}
		case 6:
		{
		
		}
	    }
	}
    }

(**********************************************************)
(******************** 	EARPRO 2019    ********************)
(**********************************************************) 