<?php /* Smarty version 2.6.25-dev, created on 2018-02-18 07:12:14
         compiled from frontend/components/header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'replace', 'frontend/components/header.tpl', 22, false),array('modifier', 'escape', 'frontend/components/header.tpl', 25, false),array('modifier', 'default', 'frontend/components/header.tpl', 25, false),array('function', 'translate', 'frontend/components/header.tpl', 23, false),array('function', 'load_menu', 'frontend/components/header.tpl', 46, false),array('function', 'url', 'frontend/components/header.tpl', 72, false),)), $this); ?>

<?php $this->assign('showingLogo', true); ?>
<?php if ($this->_tpl_vars['displayPageHeaderTitle'] && ! $this->_tpl_vars['displayPageHeaderLogo'] && is_string ( $this->_tpl_vars['displayPageHeaderTitle'] )): ?>
	<?php $this->assign('showingLogo', false); ?>
<?php endif; ?>

<!DOCTYPE html>
<html lang="<?php echo ((is_array($_tmp=$this->_tpl_vars['currentLocale'])) ? $this->_run_mod_handler('replace', true, $_tmp, '_', "-") : smarty_modifier_replace($_tmp, '_', "-")); ?>
" xml:lang="<?php echo ((is_array($_tmp=$this->_tpl_vars['currentLocale'])) ? $this->_run_mod_handler('replace', true, $_tmp, '_', "-") : smarty_modifier_replace($_tmp, '_', "-")); ?>
">
<?php if (! $this->_tpl_vars['pageTitleTranslated']): ?><?php ob_start(); ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['pageTitle']), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('pageTitleTranslated', ob_get_contents());ob_end_clean(); ?><?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "core:frontend/components/headerHead.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<body class="pkp_page_<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['requestedPage'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, 'index') : smarty_modifier_default($_tmp, 'index')); ?>
 pkp_op_<?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['requestedOp'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, 'index') : smarty_modifier_default($_tmp, 'index')); ?>
<?php if ($this->_tpl_vars['showingLogo']): ?> has_site_logo<?php endif; ?>">
	<div class="pkp_structure_page">

		<nav id="accessibility-nav" class="sr-only" role="navigation" aria-labelled-by="accessible-menu-label">
			<div id="accessible-menu-label">
				<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.themes.bootstrap3.accessible_menu.label"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>

			</div>
			<ul>
			  <li><a href="#main-navigation"><?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.themes.bootstrap3.accessible_menu.main_navigation"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
</a></li>
			  <li><a href="#main-content"><?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.themes.bootstrap3.accessible_menu.main_content"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
</a></li>
			  <li><a href="#sidebar"><?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.themes.bootstrap3.accessible_menu.sidebar"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
</a></li>
			</ul>
		</nav>

				<header class="navbar navbar-default" id="headerNavigationContainer" role="banner">

						<div class="container-fluid">
				<div class="row">
					<nav aria-label="<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.navigation.user"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
">
						<?php echo $this->_plugins['function']['load_menu'][0][0]->smartyLoadNavigationMenuArea(array('name' => 'user','id' => 'navigationUser','ulClass' => "nav nav-pills tab-list pull-right"), $this);?>

					</nav>
				</div><!-- .row -->
			</div><!-- .container-fluid -->

			<div class="container-fluid">

				<div class="navbar-header">

										<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

										<?php if ($this->_tpl_vars['requestedOp'] == 'index'): ?>
						<h1 class="site-name">
					<?php else: ?>
						<div class="site-name">
					<?php endif; ?>
						<?php ob_start(); ?>
							<?php if ($this->_tpl_vars['currentJournal'] && $this->_tpl_vars['multipleContexts']): ?>
								<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'index','router' => @ROUTE_PAGE), $this);?>

							<?php else: ?>
								<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('context' => 'index','router' => @ROUTE_PAGE), $this);?>

							<?php endif; ?>
						<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('homeUrl', ob_get_contents());ob_end_clean(); ?>
						<?php if ($this->_tpl_vars['displayPageHeaderLogo'] && is_array ( $this->_tpl_vars['displayPageHeaderLogo'] )): ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="navbar-brand navbar-brand-logo">
								<img src="<?php echo $this->_tpl_vars['publicFilesDir']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderLogo']['uploadName'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'url')); ?>
" <?php if ($this->_tpl_vars['displayPageHeaderLogo']['altText'] != ''): ?>alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderLogo']['altText'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php else: ?>alt="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.pageHeaderLogo.altText"), $this);?>
"<?php endif; ?>>
							</a>
						<?php elseif ($this->_tpl_vars['displayPageHeaderTitle'] && ! $this->_tpl_vars['displayPageHeaderLogo'] && is_string ( $this->_tpl_vars['displayPageHeaderTitle'] )): ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="navbar-brand"><?php echo $this->_tpl_vars['displayPageHeaderTitle']; ?>
</a>
						<?php elseif ($this->_tpl_vars['displayPageHeaderTitle'] && ! $this->_tpl_vars['displayPageHeaderLogo'] && is_array ( $this->_tpl_vars['displayPageHeaderTitle'] )): ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="navbar-brand navbar-brand-logo">
								<img src="<?php echo $this->_tpl_vars['publicFilesDir']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderTitle']['uploadName'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'url')); ?>
" alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['displayPageHeaderTitle']['altText'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
">
							</a>
						<?php else: ?>
							<a href="<?php echo $this->_tpl_vars['homeUrl']; ?>
" class="navbar-brand">
								<img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/templates/images/structure/logo.png" alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['applicationName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" title="<?php echo ((is_array($_tmp=$this->_tpl_vars['applicationName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
							</a>
						<?php endif; ?>
					<?php if ($this->_tpl_vars['requestedOp'] == 'index'): ?>
						</h1>
					<?php else: ?>
						</div>
					<?php endif; ?>

				</div>

								<nav id="nav-menu" class="navbar-collapse collapse" aria-label="<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.navigation.site"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
">
										<?php echo $this->_plugins['function']['load_menu'][0][0]->smartyLoadNavigationMenuArea(array('name' => 'primary','id' => "main-navigation",'ulClass' => "nav navbar-nav"), $this);?>


										<?php if (! $this->_tpl_vars['noContextsConfigured']): ?>
						<div class="pull-md-right">
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "frontend/components/searchForm_simple.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						</div>
					<?php endif; ?>
				</nav>

			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

				<div class="pkp_structure_content container">
			<main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">