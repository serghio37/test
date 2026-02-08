# tests.py - Tests relacionados
from main import SiteInfo

def test_site_info():
    site = SiteInfo()
    info = site.get_info()
    assert "Nginx" in info["tech"]
    assert info["name"] == "Mi Sitio con Docker"

def test_tech_count():
    site = SiteInfo()
    assert site.tech_count() > 0