<?php include('conexao.php'); ?>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>Etequianos</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" type="text/css" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/line-awesome.css">
	<link rel="stylesheet" type="text/css" href="css/line-awesome-font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="lib/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="lib/slick/slick-theme.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/responsive.css">
</head>

<body class="sign-in">
	<div class="wrapper">
		<div class="sign-in-page">
			<div class="signin-popup">
				<div class="signin-pop">
					<div class="row">
						<div class="col-lg-6">
							<div class="cmp-info">
								<div class="cm-logo">
									<img src="images/logo3.png" alt="">
									<p>Nosso objetivo é aproximar jovens talentos de oportunidades de emprego,
										onde seu perfil é seu currículo e as vagas são publicações.</p>
								</div>
								<!--cm-logo end-->
								<img src="images/cm-main-img.png" alt="">
							</div>
							<!--cmp-info end-->
						</div>
						<div class="col-lg-6">
							<div class="login-sec">
								<ul class="sign-control">
									<li data-tab="tab-1" class="current"><a href="#" title="">Entrar</a></li>
									<li data-tab="tab-2"><a href="#" title="">Cadastrar</a></li>
								</ul>
								<div class="sign_in_sec current" id="tab-1">

									<h3>Entre</h3>
									<?php
									if (isset($_POST['email'])) {
										Login($_POST['email'], $_POST['senha']);
									}

									?>
									<form method="post">
										<div class="row">
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="text" name="email" placeholder="Email">
													<i class="la la-user"></i>
												</div>
												<!--sn-field end-->
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="sn-field">
													<input type="password" name="senha" placeholder="Senha">
													<i class="la la-lock"></i>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<div class="checky-sec">
													<div class="fgt-sec">
														<input type="checkbox" name="cc" id="c1">
														<label for="c1">
															<span></span>
														</label>
														<small> Lembrar</small>
													</div>
													<!--fgt-sec end-->
													<a href="#" title="">Esqueceu a senha?</a>
												</div>
											</div>
											<div class="col-lg-12 no-pdd">
												<button type="submit" value="submit">Entrar</button>
											</div>
										</div>
									</form>
								</div>
								<!--sign_in_sec end-->
								<div class="sign_in_sec" id="tab-2">
									<div class="signup-tab">
										<i class="fa fa-long-arrow-right"></i>
										<h2>Quem é você?</h2>
										<ul>
											<li data-tab="tab-3" class="current"><a href="#" title="">Aluno</a></li>
											<li data-tab="tab-4"><a href="#" title="">Empresa</a></li>
										</ul>
									</div>
									<!--signup-tab end-->
									<div class="dff-tab current" id="tab-3">
										<form id="cadUsuario" method="post" action="cadastrar.php">
											<div class="row">
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" name="name" placeholder="Nome Completo">
														<i class="la la-user"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="email" name="email" placeholder="Email">
														<i class="la la-envelope"></i>
													</div>
												</div>

												<div class="col-lg-5 no-pdd">
													<div class="sn-field">
														<select name="estado" id="uf">
															<option>Selecione..</option>
															<?php
															$estados = listEstado(0);
															while ($uf = $estados->fetch_array()) {
																echo '<option value="' . $uf['id'] . '">';
																echo $uf['uf'] . '</option>';
															}
															?>
														</select>
														<i class="la la-globe"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-7 no-pdd">
													<div class="sn-field">
														<select name="cidade" id="cidade">
															<option>Cidade..</option>
														</select>
														<i class="la la-flag"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="escola" id="escola">
															<?php
															$todas = listEscola(0);
															echo '<option>Selecione..</option>';
															while ($escola = $todas->fetch_array()) {
																echo '<option value="' . $escola['id'] . '">' . $escola['nome'] . '</option>';
															}
															?>
														</select>
														<i class="la la-flag"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="curso" id="curso">
															<option>Curso..</option>
														</select>
														<i class="la la-flag"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<select name="turma" id="turma">
															<option>Turma..</option>
														</select>
														<i class="la la-flag"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<!-- <div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<ul class="avail-checks">
															<li>Gênero:</li>
															<li>
																<input type="radio" name="genero" value="F">
																<label for="c1">
																	<span></span>
																</label>
																<small>Feminino</small>
															</li>
															<li>
																<input type="radio" name="genero" value="M">
																<label for="c2">
																	<span></span>
																</label>
																<small>Masculino</small>
															</li>
															<li>
																<input type="radio" name="genero" value="I">
																<label for="c3">
																	<span></span>
																</label>
																<small>Indeterminado</small>
															</li>
														</ul>
													</div>
												</div> -->
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" id="senha" name="senha" placeholder="Senha">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" id="senha2" name="senha2" placeholder="Repita a senha">
														<i class="la la-lock"></i>
													</div>
													<span class="erro-pass" style="color:red;"></span>
												</div>
												<script>
													const s1 = document.querySelector('#senha');
													const s2 = document.querySelector('#senha2');
													const erro = document.querySelector('.erro-pass');

													function Travar() {
														event.preventDefault();
													}

													function Submit(event) {
														if (s1.value != s2.value) {
															s2.style.color = 'red';
															erro.innerHTML = 'Senhas diferentes';
															//alert ou não
															Travar();
														}
													}
													const form = document.getElementById('cadUsuario');
													form.addEventListener('submit', Submit);
												</script>
												<div class="col-lg-12 no-pdd">
													<div class="checky-sec st2">
														<div class="fgt-sec">
															<input type="checkbox" name="cc" id="c2">
															<label for="c2">
																<span></span>
															</label>
															<small>Sim, estou de acordo com os Termos & Condições.</small>
														</div>
														<!--fgt-sec end-->
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<button type="submit" value="submit">Criar conta</button>
												</div>
											</div>
											<input type="hidden" name="tipo" value="aluno">
										</form>
									</div>
									<!--dff-tab end-->
									<div class="dff-tab" id="tab-4">
										<form method="post" action="cadastrar.php" id="cadUsuario2">
											<div class="row">
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="text" name="nome_empresa" placeholder="Nome da Empresa">
														<i class="la la-building"></i>
													</div>
												</div>
												<div class="col-lg-5 no-pdd">
													<div class="sn-field">
														<select name="estado2" id="uf2">

															<option>Selecione...</option>
															<?php
															$estados = listEstado(0);
															while ($uf = $estados->fetch_array()) {
																echo '<option value="' . $uf['id'] . '">';
																echo $uf['uf'] . '</option>';
															}
															?>
														</select>
														<i class="la la-globe"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-7 no-pdd">
													<div class="sn-field">

														<select name="cidade2" id="cidade2">
															<option>Cidade..</option>
														</select>
														<i class="la la-flag"></i>
														<span><i class="fa fa-ellipsis-h"></i></span>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="email" name="email" placeholder="Email">
														<i class="la la-envelope"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" name="senha" placeholder="Senha">
														<i class="la la-lock"></i>
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<div class="sn-field">
														<input type="password" name="senha2" placeholder="Repita a senha">
														<i class="la la-lock"></i>
													</div>
													<span class="erro-pass" style="color:red;"></span>
												</div>

												<script>
													const s1E = document.querySelector('#senha');
													const s2E = document.querySelector('#senha2');
													const erroE = document.querySelector('.erro-pass');

													function Travar() {
														event.preventDefault();
													}

													function Submit(event) {
														if (s1E.value != s2E.value) {
															s2E.style.color = 'red';
															erroE.innerHTML = 'Senhas diferentes';
															//alert ou não
															Travar();
														}
													}
													const form2 = document.getElementById('cadUsuario2');
													form2.addEventListener('submit', Submit);
												</script>

												<div class="col-lg-12 no-pdd">
													<div class="checky-sec st2">
														<div class="fgt-sec">
															<input type="checkbox" name="cc" id="c3">
															<label for="c3">
																<span></span>
															</label>
															<small>Sim, estou de acordo com os Termos & Condições.</small>
														</div>
														<!--fgt-sec end-->
													</div>
												</div>
												<div class="col-lg-12 no-pdd">
													<button type="submit" value="submit">Criar conta</button>
												</div>
											</div>
											<input type="hidden" name="tipo" value="empresa">
										</form>
									</div>
									<!--dff-tab end-->
								</div>
							</div>
							<!--login-sec end-->
						</div>
					</div>
				</div>
				<!--signin-pop end-->
			</div>
			<!--signin-popup end-->
			<div class="footy-sec">
				<div class="container">
					<ul>
						<li><a href="#" title="">Dúvidas</a></li>
						<li><a href="#" title="">Privacidade</a></li>
						<li><a href="#" title="">Comunidade</a></li>
						<li><a href="#" title="">Cookies</a></li>
						<li><a href="#" title="">Vagas</a></li>
					</ul>
					<p><img src="images/logo3.png" alt="" style="height: 1.5vw;"></p>
				</div>
			</div>
			<!--footy-sec end-->
		</div>
		<!--sign-in-page end-->


	</div>
	<!--theme-layout end-->



	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/popper.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="lib/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>

</html>