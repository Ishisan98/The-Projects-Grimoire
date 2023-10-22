namespace The_Projects_Grimoire.Models
{
    public class Project
    {
        public int Project_Id { get; set; }

        public string Project_Name { get; set; }

        public string? Description { get; set; }

        public DateTime? Created_Date { get; set; }

        public bool Project_Status { get; set; }
    }
}
