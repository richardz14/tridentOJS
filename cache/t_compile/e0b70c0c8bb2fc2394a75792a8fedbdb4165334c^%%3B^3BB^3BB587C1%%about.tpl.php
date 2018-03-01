<?php /* Smarty version 2.6.25-dev, created on 2018-02-21 09:21:36
         compiled from frontend/pages/about.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'frontend/pages/about.tpl', 20, false),)), $this); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/header.tpl", 'smarty_include_vars' => array('pageTitle' => "about.aboutContext")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div id="main-content" class="page page_about">

	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/breadcrumbs.tpl", 'smarty_include_vars' => array('currentTitleKey' => "about.aboutContext")));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

		<div class="page-header">
		<h1><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.aboutContext"), $this);?>
</h1>
	</div>
	
	<?php echo $this->_tpl_vars['currentContext']->getLocalizedSetting('about'); ?>

</div><!-- .page -->

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/frontend/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>