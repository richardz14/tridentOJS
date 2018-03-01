<?php /* Smarty version 2.6.25-dev, created on 2018-03-01 12:31:38
         compiled from frontend/pages/userRegister.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'frontend/pages/userRegister.tpl', 16, false),array('function', 'csrf', 'frontend/pages/userRegister.tpl', 17, false),array('function', 'translate', 'frontend/pages/userRegister.tpl', 56, false),array('modifier', 'escape', 'frontend/pages/userRegister.tpl', 20, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/header.tpl", 'smarty_include_vars' => array('pageTitle' => "user.register")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div id="main-content" class="page page_register">

	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/breadcrumbs.tpl", 'smarty_include_vars' => array('currentTitleKey' => "user.register")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

	<form class="pkp_form register" id="register" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'register'), $this);?>
">
		<?php echo $this->_plugins['function']['csrf'][0][0]->smartyCSRF(array(), $this);?>


		<?php if ($this->_tpl_vars['source']): ?>
			<input type="hidden" name="source" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['source'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
		<?php endif; ?>

		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/formErrors.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/registrationForm.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

				<?php if ($this->_tpl_vars['currentContext']): ?>

						<?php $this->assign('contextId', $this->_tpl_vars['currentContext']->getId()); ?>
			<?php $_from = $this->_tpl_vars['readerUserGroups'][$this->_tpl_vars['contextId']]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['userGroup']):
?>
				<?php if (in_array ( $this->_tpl_vars['userGroup']->getId() , $this->_tpl_vars['userGroupIds'] )): ?>
					<?php $this->assign('userGroupId', $this->_tpl_vars['userGroup']->getId()); ?>
					<input type="hidden" name="readerGroup[<?php echo $this->_tpl_vars['userGroupId']; ?>
]" value="1">
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
			<?php $_from = $this->_tpl_vars['authorUserGroups'][$this->_tpl_vars['contextId']]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['userGroup']):
?>
				<?php if (in_array ( $this->_tpl_vars['userGroup']->getId() , $this->_tpl_vars['userGroupIds'] )): ?>
					<?php $this->assign('userGroupId', $this->_tpl_vars['userGroup']->getId()); ?>
					<input type="hidden" name="authorGroup[<?php echo $this->_tpl_vars['userGroupId']; ?>
]" value="1">
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>

						<?php $this->assign('userCanRegisterReviewer', 0); ?>
			<?php $_from = $this->_tpl_vars['reviewerUserGroups'][$this->_tpl_vars['contextId']]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['userGroup']):
?>
				<?php if ($this->_tpl_vars['userGroup']->getPermitSelfRegistration()): ?>
					<?php $this->assign('userCanRegisterReviewer', $this->_tpl_vars['userCanRegisterReviewer']+1); ?>
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
			<?php if ($this->_tpl_vars['userCanRegisterReviewer']): ?>
				<fieldset class="reviewer">
					<legend>
						<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.reviewerPrompt"), $this);?>

					</legend>
					<div class="fields">
						<div id="reviewerOptinGroup" class="form-group optin">
							<?php $_from = $this->_tpl_vars['reviewerUserGroups'][$this->_tpl_vars['contextId']]; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['userGroup']):
?>
								<?php if ($this->_tpl_vars['userGroup']->getPermitSelfRegistration()): ?>
									<label>
										<?php $this->assign('userGroupId', $this->_tpl_vars['userGroup']->getId()); ?>
										<input type="checkbox" name="reviewerGroup[<?php echo $this->_tpl_vars['userGroupId']; ?>
]" value="1"<?php if (in_array ( $this->_tpl_vars['userGroupId'] , $this->_tpl_vars['userGroupIds'] )): ?> checked="checked"<?php endif; ?>>
										<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.reviewerPrompt.userGroup",'userGroup' => $this->_tpl_vars['userGroup']->getLocalizedName()), $this);?>

									</label>
								<?php endif; ?>
							<?php endforeach; endif; unset($_from); ?>
						</div>
					</div>
				</fieldset>
			<?php endif; ?>
		<?php endif; ?>

		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/registrationFormContexts.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

				<?php if ($this->_tpl_vars['reCaptchaHtml']): ?>
			<fieldset class="recaptcha_wrapper">
				<div class="fields">
					<div class="form-group recaptcha">
						<?php echo $this->_tpl_vars['reCaptchaHtml']; ?>

					</div>
				</div>
			</fieldset>
		<?php endif; ?>

		<div class="buttons">
			<button class="btn btn-primary submit" type="submit">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register"), $this);?>

			</button>

			<?php ob_start(); ?><?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'profile','path' => 'roles'), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('rolesProfileUrl', ob_get_contents());ob_end_clean(); ?>
			<a class="btn btn-default" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login','source' => $this->_tpl_vars['rolesProfileUrl']), $this);?>
" class="login">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.login"), $this);?>

			</a>
		</div>
	</form>


<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/frontend/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>