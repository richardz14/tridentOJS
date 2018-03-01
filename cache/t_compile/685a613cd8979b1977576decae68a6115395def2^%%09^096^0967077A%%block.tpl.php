<?php /* Smarty version 2.6.25-dev, created on 2018-03-01 12:19:41
         compiled from file:C:%5Cxampp5%5Chtdocs%5Cnewblog%5CtridentOJS%5Cplugins/blocks/information%5Cblock.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'file:C:\\xampp5\\htdocs\\newblog\\tridentOJS\\plugins/blocks/information\\block.tpl', 13, false),array('function', 'url', 'file:C:\\xampp5\\htdocs\\newblog\\tridentOJS\\plugins/blocks/information\\block.tpl', 18, false),)), $this); ?>
<?php if (! empty ( $this->_tpl_vars['forReaders'] ) || ! empty ( $this->_tpl_vars['forAuthors'] ) || ! empty ( $this->_tpl_vars['forLibrarians'] )): ?>
<div class="pkp_block block_information">
	<span class="title"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.information.link"), $this);?>
</span>
	<div class="content">
		<ul>
			<?php if (! empty ( $this->_tpl_vars['forReaders'] )): ?>
				<li>
					<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'information','op' => 'readers'), $this);?>
">
						<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.infoForReaders"), $this);?>

					</a>
				</li>
			<?php endif; ?>
			<?php if (! empty ( $this->_tpl_vars['forAuthors'] )): ?>
				<li>
					<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'information','op' => 'authors'), $this);?>
">
						<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.infoForAuthors"), $this);?>

					</a>
				</li>
			<?php endif; ?>
			<?php if (! empty ( $this->_tpl_vars['forLibrarians'] )): ?>
				<li>
					<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'information','op' => 'librarians'), $this);?>
">
						<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.infoForLibrarians"), $this);?>

					</a>
				</li>
			<?php endif; ?>
		</ul>
	</div>
</div>
<?php endif; ?>