
<?php
include 'conection.php';
class Querys extends ConnectionDb{
    public function getInfoBasic(){
        $cmd = $this->getConnection()->prepare('SELECT Nombre, apellido, email, Telefono, direccion, descripcion FROM personas');
        $cmd->execute();

        if($reader = $cmd->fetchAll()){
            $basic_info = $reader;
            return json_encode($reader);
        }else{
            return  'No se pudo leer';
        }
    }
    public function getLaboralExperience(){
        $cmd = $this->getConnection()->prepare('SELECT * FROM vw_programas_experiencia;');
        $cmd->execute();

        if($reader = $cmd->fetchAll()){
            $basic_info = $reader;
            return json_encode($reader);
        }else{
            return  'No se pudo leer';
        }
    }
    public function getProgramsSkills(){
        $cmd = $this->getConnection()->prepare('SELECT * FROM my_cv.vw_programs_people;');
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