<?php
session_start();
$user = 'root';
$pass = 'usbw';
$bd = 'projeto';
$server = 'localhost';
$con = new mysqli($server, $user, $pass, $bd);
$con->query("SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");

if (!$con) {
	echo 'Problemas na conexão.';
}

function block()
{
	if (!isset($_SESSION['id']))
		vai('sign-in.php');
}

function TrocarFoto()
{
	$destino = './fotos/' . $_SESSION['id'] . '/';
	if (!is_dir($destino)) {
		mkdir($destino, 0777);
	}
	$destino .= $_FILES['foto']['name'];
	if (move_uploaded_file($_FILES['foto']['tmp_name'], $destino)) {
		//deu certo
		$sql = 'UPDATE aluno SET foto = "' . $destino . '" WHERE id=' . $_SESSION['id'];
		$res = $GLOBALS['con']->query($sql);
		if ($res) {
			alert("Foto Atualizada");
		}
	} else {
		//não deu certo
		alert("Erro ao atualizar foto. Tente mais tarde");
	}
}

/*LOGIN*/
function Login($email, $senha)
{
	$sql = 'SELECT * FROM aluno WHERE email="' . $email . '"';
	$sql .= ' AND senha ="' . $senha . '"';
	$res = $GLOBALS['con']->query($sql);

	if ($res->num_rows > 0) { //ENCONTROU O ALUNO
		$aluno = $res->fetch_array(); //array com os dados
		//armazenando dados da sessão
		$_SESSION['id'] = $aluno['id'];
		$_SESSION['nome'] = $aluno['nome'];
		$_SESSION['genero'] = $aluno['genero'];
		$_SESSION['nascimento'] = $aluno['nascimento'];
		$_SESSION['foto'] = $aluno['foto'];
		$_SESSION['telefone'] = $aluno['telefone'];
		$_SESSION['endereco'] = $aluno['endereco'];
		$_SESSION['cidade_id'] = $aluno['cidade_id'];
		$_SESSION['turma_id'] = $aluno['turma_id'];
		$_SESSION['view'] = $aluno['view'];
		$_SESSION['senha'] = $aluno['senha'];
		vai('index.php');
	} else {
		$sql = 'SELECT * FROM empresa WHERE email="' . $email . '"';
		$sql .= ' AND senha ="' . $senha . '"';
		$res = $GLOBALS['con']->query($sql);

		if ($res->num_rows > 0) { //encontou empresa
			$emp = $res->fetch_array(); //array com os dados
			//armazenando dados da sessão
			$_SESSION['id'] = $emp['id'];
			$_SESSION['nome'] = $emp['nome'];
			$_SESSION['site'] = $emp['site'];
			$_SESSION['email'] = $emp['email'];
			$_SESSION['endereco'] = $emp['endereco'];
			$_SESSION['telefone'] = $emp['telefone'];
			$_SESSION['foto'] = $emp['foto'];
			$_SESSION['cidade_id'] = $emp['cidade_id'];
			$_SESSION['senha'] = $emp['senha'];
			vai('index.php');
		} else {
			alert("Usuário e/ou senha inválidos");
		}
	}
}

/*-----------EMPRESA--------------*/
function CadEmpresa($nome, $email, $cidade, $senha)
{
	$sql = 'INSERT INTO empresa (id,nome,email,cidade_id,senha) VALUES (null, ';
	$sql .= '"' . $nome . '",';
	$sql .= '"' . $email . '",';
	$sql .= '"' . $cidade . '",';
	$sql .= $senha . ')';
	$res = $GLOBALS['con']->query($sql);
	if ($res) {
		//cadastrado

		alert("Cadastrado com sucesso!\n>Login liberado.");
		vai('sign-in.php');
	} else {
		echo $sql;
		//erro ao cadastrar
		alert("Erro ao cadastrar" . $sql);
		//volta();
	}
}
/*--------------EMPRESA--------------*/
/*----------ALUNO ----------- */
function CadAluno($nome, $email, $cidade, $senha, $turma)
{
	$sql = 'INSERT INTO aluno (id,nome,email,cidade_id, senha, turma_id) VALUES (null, ';
	$sql .= '"' . $nome . '",';
	$sql .= '"' . $email . '",';
	$sql .= '"' . $cidade . '",';
	$sql .= '"' . $senha . '",';
	$sql .= $turma . ')';
	$res = $GLOBALS['con']->query($sql);
	if ($res) {
		//cadastrado

		alert("Cadastrado com sucesso!\n>Login liberado.");
		vai('sign-in.php');
	} else {
		echo $sql;
		//erro ao cadastrar
		alert("Erro ao cadastrar" . $sql);
		//volta();
	}
}
/*----------./ALUNO ----------- */
function alert($msg)
{
	echo '<script> alert("' . $msg . '"); </script>';
}
function vai($pagina)
{
	echo '<script> window.location="' . $pagina . '" </script>';
}
function volta()
{
	echo '<script> window.history.go(-1); </script>';
}
/*----------ESCOLA ----------- */
function listEscola($id)
{
	$sql = 'SELECT * FROM escola';
	if ($id > 0)
		$sql .= ' WHERE id =' . $id;
	$res = $GLOBALS['con']->query($sql);
	return $res;
}
/*---------- ./ESCOLA ----------- */
/*----------CURSO ----------- */
function listCurso($id, $escola)
{
	$sql = 'SELECT * FROM curso';
	if ($id > 0)
		$sql .= ' WHERE id =' . $id;
	else if ($escola > 0) {
		$sql .= ' WHERE escola_id =' . $escola;
	}
	$res = $GLOBALS['con']->query($sql);
	return $res;
}
function listTurma($id, $escola)
{
	$sql = 'SELECT * FROM turma';
	if ($id > 0)
		$sql .= ' WHERE id =' . $id;
	else if ($escola > 0) {
		$sql .= ' WHERE curso_id =' . $escola;
	}
	$res = $GLOBALS['con']->query($sql);
	return $res;
}
/*---------- ./CURSO ----------- */

function listEstado($id)
{
	$sql = 'SELECT * FROM estado';
	if ($id > 0)
		$sql .= ' WHERE id =' . $id;
	$res = $GLOBALS['con']->query($sql);
	return $res;
}

function listCidade($id, $estado)
{
	$sql = 'SELECT * FROM cidade';
	if ($id > 0)
		$sql .= ' WHERE id =' . $id;
	else if ($estado > 0)
		$sql .= ' WHERE estado_id =' . $estado;
	$res = $GLOBALS['con']->query($sql);
	return $res;
}
