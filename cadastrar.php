<?php
include('conexao.php');
if ($_POST) {
	if (isset($_POST['tipo']) && $_POST['tipo'] == 'aluno') {
		CadAluno($_POST['name'], $_POST['email'], $_POST['cidade'], $_POST['senha'], $_POST['turma']);
	} else {
		CadEmpresa($_POST['nome_empresa'], $_POST['email'], $_POST['cidade2'], $_POST['senha']);
	}
}
