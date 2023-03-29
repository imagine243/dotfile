# svn update
function svnupdate()
{
	svn revert . -R
	svn up
	svn cleanup --remove-unversioned
}
