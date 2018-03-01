<?php /* Smarty version 2.6.25-dev, created on 2018-03-01 12:19:50
         compiled from frontend/pages/userLogin.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'frontend/pages/userLogin.tpl', 22, false),array('function', 'csrf', 'frontend/pages/userLogin.tpl', 27, false),array('function', 'url', 'frontend/pages/userLogin.tpl', 51, false),array('modifier', 'strip_unsafe_html', 'frontend/pages/userLogin.tpl', 28, false),array('modifier', 'escape', 'frontend/pages/userLogin.tpl', 28, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/header.tpl", 'smarty_include_vars' => array('pageTitle' => "user.login")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div id="main-content" class="page page_login">

	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/breadcrumbs.tpl", 'smarty_include_vars' => array('currentTitleKey' => "user.login")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

		<?php if ($this->_tpl_vars['loginMessage']): ?>
		<div class="alert alert-info" role="alert">
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['loginMessage']), $this);?>

		</div>
	<?php endif; ?>

	<form class="pkp_form login" id="login" method="post" action="<?php echo $this->_tpl_vars['loginUrl']; ?>
">
		<?php echo $this->_plugins['function']['csrf'][0][0]->smartyCSRF(array(), $this);?>

		<input type="hidden" name="source" value="<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['source'])) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : PKPString::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />

		<?php if ($this->_tpl_vars['error']): ?>
			<div class="alert alert-danger" role="alert">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['error'],'reason' => $this->_tpl_vars['reason']), $this);?>

			</div>
		<?php endif; ?>

		<div class="form-group">
			<label for="login-username">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.username"), $this);?>

			</label>
			<input type="text" name="username" class="form-control" id="login-username" placeholder="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => 'user.username'), $this);?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['username'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" maxlenght="32" required>
		</div>

		<div class="form-group">
			<label for="login-password">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.password"), $this);?>

			</label>
			<input type="password" name="password" class="form-control" id="login-password" placeholder="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => 'user.password'), $this);?>
" password="true" maxlength="32" required="$passwordRequired">
		</div>

		<div class="form-group">
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login','op' => 'lostPassword'), $this);?>
">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login.forgotPassword"), $this);?>

			</a>
		</div>

		<div class="checkbox">
			<label>
				<input type="checkbox" name="remember" id="remember" value="1" checked="$remember"> <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login.rememberUsernameAndPassword"), $this);?>

			</label>
		</div>

		<div class="buttons">
			<button type="submit" class="btn btn-primary">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login"), $this);?>

			</button>

			<?php if (! $this->_tpl_vars['disableUserReg']): ?>
				<?php ob_start(); ?><?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'register','source' => $this->_tpl_vars['source']), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('registerUrl', ob_get_contents());ob_end_clean(); ?>
				<a class="btn btn-default register-button" href="<?php echo $this->_tpl_vars['registerUrl']; ?>
" role="button">
					<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login.registerNewAccount"), $this);?>

				</a>
			<?php endif; ?>
		</div>
	</form>
</div><!-- .page -->

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/frontend/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>