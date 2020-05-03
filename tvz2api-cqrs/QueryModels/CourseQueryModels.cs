using tvz2api_cqrs.Models.DTO;
using System.Collections.Generic;

namespace tvz2api_cqrs.QueryModels
{
  public class CourseQueryModel
  {
    public int Id { get; set; }
    public string Name { get; set; }
    public string Isvu { get; set; }
    public int? Ects { get; set; }
    public int? SmjerId { get; set; }
    public bool Subscribed { get; set; }
  }

  public class CourseDetailsQueryModel
  {
    public int Id { get; set; }
    public string Name { get; set; }
    public string Isvu { get; set; }
    public int? Ects { get; set; }
    public string Smjer { get; set; }
    public List<SidebarContentDTO> SidebarContents { get; set; }
  }
}
