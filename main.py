# main.py - Versión relacionada con el sitio web
class SiteInfo:
    """Información sobre el sitio web"""
    
    def __init__(self):
        self.site_name = "Mi Sitio con Docker"
        self.technologies = ["Nginx", "Docker", "Python", "GitHub Actions"]
        self.version = "1.0"
    
    def get_info(self) -> dict:
        """Obtiene información del sitio"""
        return {
            "name": self.site_name,
            "tech": self.technologies,
            "version": self.version,
            "description": "Sitio web servido con Nginx en contenedor Docker"
        }
    
    def tech_count(self) -> int:
        """Cuenta tecnologías usadas"""
        return len(self.technologies)