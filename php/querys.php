
<?php
include 'conection.php';
class Querys extends ConnectionDb{
    public function getInfoBasic(){
        $cmd = $this->getConnection()->prepare('SELECT Nombre, apellido, Email, Telefono, Direccion, Descripcion FROM Personas');
        $cmd->execute();

        if($reader = $cmd->fetchAll()){
            $basic_info = $reader;
            return json_encode($reader);
        }else{
            return  'No se pudo leer';
        }
    }
    public function getLaboralExperience(){
        $cmd = $this->getConnection()->prepare('SELECT * FROM Vw_Programas_experiencia;');
        $cmd->execute();

        if($reader = $cmd->fetchAll()){
            $basic_info = $reader;
            return json_encode($reader);
        }else{
            return  'No se pudo leer';
        }
    }
    public function getProgramsSkills(){
        $cmd = $this->getConnection()->prepare('SELECT * FROM Vw_Programs_people;');
        $cmd->execute();

        if($reader = $cmd->fetchAll()){
            $basic_info = $reader;
            return json_encode($reader);
        }else{
            return  'No se pudo leer';
        }
    }
    public function getTotalInfo(){
        $estructure = array(
            "BasicInfo"=>$this->getInfoBasic(),
            "LaboralExperience"=>$this->getLaboralExperience(),
            "ProgramSkills"=>$this->getProgramsSkills()
        );
        return json_encode($estructure);
    }
}
?>