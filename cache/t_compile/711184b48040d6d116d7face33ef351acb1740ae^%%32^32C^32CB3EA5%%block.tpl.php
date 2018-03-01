<?php /* Smarty version 2.6.25-dev, created on 2018-02-18 07:12:14
         compiled from file:/home/tridentj/public_html/tridentOJS/plugins/blocks/information/block.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'file:/home/tridentj/public_html/tridentOJS/plugins/blocks/information/block.tpl', 13, false),array('function', 'url', 'file:/home/tridentj/public_html/tridentOJS/plugins/blocks/information/block.tpl', 18, false),)), $this); ?>
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