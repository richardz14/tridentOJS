<?php /* Smarty version 2.6.25-dev, created on 2018-02-18 07:12:14
         compiled from frontend/components/footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'call_hook', 'frontend/components/footer.tpl', 19, false),array('function', 'translate', 'frontend/components/footer.tpl', 21, false),array('function', 'load_script', 'frontend/components/footer.tpl', 50, false),array('modifier', 'escape', 'frontend/components/footer.tpl', 21, false),)), $this); ?>

	</main>

		<?php if (empty ( $this->_tpl_vars['isFullWidth'] )): ?>
		<?php ob_start(); ?><?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Common::Sidebar"), $this);?>
<?php $this->_smarty_vars['capture']['default'] = ob_get_contents();  $this->assign('sidebarCode', ob_get_contents());ob_end_clean(); ?>
		<?php if ($this->_tpl_vars['sidebarCode']): ?>
			<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-2 col-md-4" role="complementary" aria-label="<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.navigation.sidebar"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp));?>
">
				<?php echo $this->_tpl_vars['sidebarCode']; ?>

			</aside><!-- pkp_sidebar.left -->
		<?php endif; ?>
	<?php endif; ?>
	</div><!-- pkp_structure_content -->

	<footer class="footer" role="contentinfo">

		<div class="container">

			<div class="row">
				<?php if ($this->_tpl_vars['pageFooter']): ?>
				<div class="col-md-10">
					<?php echo $this->_tpl_vars['pageFooter']; ?>

				</div>
				<?php endif; ?>

				<div class="col-md-2" role="complementary">
					<a href="<?php echo $this->_tpl_vars['pkpLink']; ?>
">
						<img class="img-responsive" alt="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.publicKnowledgeProject"), $this);?>
" src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/<?php echo $this->_tpl_vars['brandImage']; ?>
">
					</a>
				</div>

			</div> <!-- .row -->
		</div><!-- .container -->
	</footer>
</div><!-- pkp_structure_page -->

<?php echo $this->_plugins['function']['load_script'][0][0]->smartyLoadScript(array('context' => 'frontend','scripts' => $this->_tpl_vars['scripts']), $this);?>


<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Common::Footer::PageFooter"), $this);?>

</body>
</html>