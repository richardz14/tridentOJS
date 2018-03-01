<?php /* Smarty version 2.6.25-dev, created on 2018-02-18 07:12:14
         compiled from file:/home/tridentj/public_html/tridentOJS/plugins/blocks/makeSubmission/block.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'file:/home/tridentj/public_html/tridentOJS/plugins/blocks/makeSubmission/block.tpl', 12, false),array('function', 'translate', 'file:/home/tridentj/public_html/tridentOJS/plugins/blocks/makeSubmission/block.tpl', 13, false),)), $this); ?>
<div class="pkp_block block_make_submission">
	<div class="content">
		<a class="block_make_submission_link" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('router' => @ROUTE_PAGE,'page' => 'about','op' => 'submissions'), $this);?>
">
			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.makeSubmission.linkLabel"), $this);?>

		</a>
	</div>
</div>