using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MessagesViewModels
/// </summary>
/// 

public class ContactUsModel
{
    public string Name { get; set; }
    public string Mobile { get; set; }
    public string Email { get; set; }
    public string Message { get; set; }
}
public class TrainingRegModel
{
    public int ModuleTypeID { get; set; }
    public int RelatedItemID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Mobile { get; set; }
    public string Tel { get; set; }
    public string Email { get; set; }
}

public class JsonTextResult
{
    public JsonTextResult() { }
    public JsonTextResult(string message)
    {
        Message = message;
    }
    public string Message { get; set; }
  
}
public class City
{
    private string name;
    public string Name
    {
        get
        {
            return name;
        }
        set
        {
            name = value;
        }
    }

    private int population;
    public int Population
    {
        get
        {
            return population;
        }
        set
        {
            population = value;
        }
    }
}