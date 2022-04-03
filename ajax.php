<?php
include('conexao.php');

if(isset($_GET['cidade_estado'])){
	$todos = listCidade(0,$_GET['cidade_estado']);
	$retorno = '';
	while($cidade = $todos->fetch_array()){
		$retorno.= '<option value="'.$cidade['id'].'">';
		$retorno.= $cidade['nome'].'</option>';
	}
	echo $retorno;
}

if(isset($_GET['cidade_estado'])){
	$todos = listCidade(0,$_GET['cidade_estado']);
	$retorno = '';
	while($cidade2 = $todos->fetch_array()){
		$retorno.= '<option value="'.$cidade2['id'].'">';
		$retorno.= $cidade2['nome'].'</option>';
	}
	echo $retorno;
}

else if(isset($_GET['curso_escola'])){
	$todos = listCurso(0,$_GET['curso_escola']);
	$retorno = '<option>Curso..</option>';
	while($curso = $todos->fetch_array()){
		$retorno.= '<option value="'.$curso['id'].'">';
		$retorno.= $curso['nome'].'</option>';
	}
	echo $retorno;
}
else if(isset($_GET['turma_curso'])){
	$todos = listTurma(0,$_GET['turma_curso']);
	$retorno = '<option>Turma..</option>';
	while($turma = $todos->fetch_array()){
		$retorno.= '<option value="'.$turma['id'].'">';
		$retorno.= $turma['sigla'].'</option>';
	}
	echo $retorno;
}
