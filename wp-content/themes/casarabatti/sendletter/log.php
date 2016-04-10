<?php

class log
{
	public $erroreinviolog = 'logs/erroreinvio.log';
	public $errorLog = 'logs/errori.log';
	public $inviolog = 'logs/invio.log';
	public $popolalog = '../logs/popola_error.log';
	public $new_address_log = 'logs/newAddress.log'; 
	
	public $fileH1;
	public $fileH2;
	public $fileH3;
	public $fileH4;
	public $fileH5;
	

	function __construct() {
		$now = date("YmdHi");
		$this->inviolog = 'logs/invio' . $now . '.log';
		$this->popolalog = '../logs/' . date("Ymd") .'_popola.log';
		
	}
	
	function close(){
		fclose($file1);
		$fileH1 = FALSE;
	}
	
	
	function scrivi_invio($stringa)
	{
		$data = date('Y-m-d, H:i:s');
		$log = $data."\t".$stringa."\n";
		// Apertura file
		//version 1
// 		if ($fileH1 = fopen($this->inviolog, 'a')) {
// 			if (fwrite($fileH1, $log)== false) {
// 				$file2 = fopen('logs/errlog01.log', 'a');
// 				fwrite($file2, 'impossibile scrivere il file ' . $inviolog);
// 				fclose($file2);
// 			}
// 			fclose($fileH1);
// 		} else {
// 			$file2 = fopen('logs/errlog02.log', 'a');
// 			fwrite($file2,  'impossibile aprire il file ' . $inviolog);
// 			fclose($file2);
// 		}
		
		//version 2
		if($fileH1 == FALSE){
			if (!$fileH1 = fopen($this->inviolog, 'a')) {
				$file2 = fopen('logs/errlog02.log', 'a');
				fwrite($file2,  'impossibile aprire il file ' . $inviolog);
				fclose($file2);
			}	
		}
		if($fileH1!=FALSE ){
			if (fwrite($fileH1, $log)== false) {
				$file2 = fopen('logs/errlog01.log', 'a');
				fwrite($file2, 'impossibile scrivere il file ' . $inviolog);
				fclose($file2);
			}
		}
	}
	
	function scrivi_errore_invio($stringa)
	{
		$data = date('Y-m-d, H:i:s');
		$log = $data."\t".$stringa."\n";
		// Apertura file
		if ($fileH2 = fopen($this->erroreinviolog, 'a')) {
			if (fwrite($fileH2, $log)== false) {
				$file2 = fopen('logs/errlog01.log', 'a');
				fwrite($file2, 'impossibile scrivere il file ' . $erroreinviolog);
				fclose($file2);
			}
			fclose($fileH2);
		} else {
			$file2 = fopen('logs/errlog02.log', 'a');
			fwrite($file2,  'impossibile aprire il file ' . $erroreinviolog);
			fclose($file2);
		}
	}
	
	function scrivi_errori($stringa)
	{
		$data = date('Y-m-d, H:i:s');
		$log = $data."\t".$stringa."\n";
		// Apertura file
		if ($fileH3 = fopen($this->errorLog, 'a')) {
			if (fwrite($fileH3, $log)== false) {
				$file2 = fopen('logs/errlog01.log', 'a');
				fwrite($file2, 'impossibile scrivere il file ' . $errorLog);
				fclose($file2);
			}
			fclose($fileH3);
		} else {
			$file2 = fopen('logs/errlog02.log', 'a');
			fwrite($file2,  'impossibile aprire il file ' . $errorLog);
			fclose($file2);
		}
	}
	
	/*
	 * remember to close the file
	 */
	function scrivi_popola($stringa)
	{

		$log = $stringa."\n";
		// Apertura file
		if(!$fileH4){
			if (!$fileH4 = fopen($this->popolalog, 'a')) {
				$file2 = fopen('../logs/errlog02.log', 'a');
				fwrite($file2,  'impossibile aprire il file ' . $errorLog);
				fclose($file2);
			}
		}
		if($fileH4){
			if (fwrite($fileH4, $log)== false) {
				$file2 = fopen('../logs/errlog01.log', 'a');
				fwrite($file2, 'impossibile scrivere il file ' . $errorLog);
				fclose($file2);
			}
		}
	}
	
	function close_popola(){
		if($fileH4){
			fclose($fileH4);
			$fileH4 = FALSE;
		}
	}
	
	
	/*
	 * 
	*/
	function log_address($stringa)
	{	
		$log = $stringa."\n";
		// Apertura file
		if ($fileH5 = fopen($this->new_address_log, 'a')) {
			if (fwrite($fileH5, $log)== false) {
				$file2 = fopen('logs/errlog01.log', 'a');
				fwrite($file2, 'impossibile scrivere il file ' . $new_address_log);
				fclose($file2);
			}
			fclose($fileH5);
		} else {
			$file2 = fopen('logs/errlog02.log', 'a');
			fwrite($file2,  'impossibile aprire il file ' . $new_address_log);
			fclose($file2);
		}
	}
}

?>