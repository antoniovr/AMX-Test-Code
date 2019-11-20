PROGRAM_NAME='test'
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 11/12/2019  AT: 15:16:26        *)
(***********************************************************)

DEFINE_DEVICE 

    dvTp = 10001:1:0
    vdvSystem = 33000:1:0


#include 'CUSTOMAPI'

DEFINE_CONSTANT

    // Id del timeline, única por cada bloque de código cerrado
    volatile long _TLID = 1

DEFINE_VARIABLE

    // Definimos los tiempos de los que está compuesto nuestro timeline
    volatile long lTimes[] = {30000} // Actualiza el feedback cada 30 segundos

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
    
    set_log_level(3)

DEFINE_EVENT

    timeline_event[_TLID]
    {
	// Entrará aquí cada 30 segundos
	send_string 0,"'I´m alive'"
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
		    fnInfo("'hello there!'")
		}
		case 2:
		{
		    send_string 0,'how is it going?'
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
(*		        END OF PROGRAM 			  *)
(**********************************************************) 