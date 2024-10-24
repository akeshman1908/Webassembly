using Frontend.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using System.Net.Http;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

// Voeg je Blazor WebAssembly Custom Element toe
builder.RootComponents.RegisterCustomElement<TodoItem>("todo-item");

// Configureer de HttpClient om de base URL te gebruiken van de gehoste Blazor-app
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

await builder.Build().RunAsync();