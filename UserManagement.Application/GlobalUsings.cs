global using AutoMapper;
global using FluentValidation;
global using MediatR;
global using Microsoft.AspNetCore.Diagnostics;
global using Microsoft.AspNetCore.Http;
global using Microsoft.Extensions.Options;
global using Microsoft.IdentityModel.Tokens;
global using Serilog;
global using System;
global using System.Collections.Generic;
global using System.IdentityModel.Tokens.Jwt;
global using System.Linq;
global using System.Security.Claims;
global using System.Text;
global using System.Threading.Tasks;
global using UserManagement.Application.Commands.ContactDetail;
global using UserManagement.Application.Commands.ContactOrganization;
global using UserManagement.Application.Commands.Login;
global using UserManagement.Application.Commands.Organization;
global using UserManagement.Application.Commands.RefreshToken;
global using UserManagement.Application.Commands.Role;
global using UserManagement.Application.Commands.User;
global using UserManagement.Application.Commands.UserRole;
global using UserManagement.Application.JwtTokenGenerator.Abstraction;
global using UserManagement.Application.Queries.Contact;
global using UserManagement.Application.Queries.ContactOrganization;
global using UserManagement.Application.Queries.Organization;
global using UserManagement.Application.Queries.Role;
global using UserManagement.Application.Queries.User;
global using UserManagement.Application.Queries.UserRole;
global using UserManagement.Application.Services.Abstraction;
global using UserManagement.Domain.Attribute;
global using UserManagement.Domain.Dto;
global using UserManagement.Domain.Models.ContactOrganization;
global using UserManagement.Domain.Models.LoginUser;
global using UserManagement.Domain.Models.Role;
global using UserManagement.Domain.Models.User;
global using UserManagement.Infrastructure.Abstraction;
global using UserManagement.ViewModel.Models.ContactOrganization;
global using UserManagement.ViewModel.Models.LoginUser;
global using UserManagement.ViewModel.Models.Role;
global using UserManagement.ViewModel.Models.User;
global using UserManagement.ViewModel.Models.OrganizationLocation;
global using UserManagement.Application.Commands.OrganizationLocation;
global using UserManagement.Application.Queries.OrganizationLocation;
global using UserManagement.Domain.Models.OrganizationLocation;
global using UserManagement.ViewModel.Models.Providers;
global using UserManagement.ViewModel.Models.Service;
global using UserManagement.ViewModel.Models.ServiceProvider;
global using UserManagement.Application.Commands.Providers;
global using UserManagement.Application.Queries.Providers;
global using UserManagement.Application.Commands.Service;
global using UserManagement.Application.Queries.Service;
global using UserManagement.Application.Commands.ServiceProvider;
global using UserManagement.Application.Queries.ServiceProvider;
global using UserManagement.Domain.Models.Providers;
global using UserManagement.Domain.Models.Service;
global using UserManagement.Domain.Models.ServiceProviderl;
global using UserManagement.ViewModel.Models.Booking;
global using UserManagement.Application.Commands.Booking;
global using UserManagement.Application.Queries.Booking;
global using UserManagement.Domain.Models.Booking;
global using UserManagement.Domain.Models.Countries;
global using UserManagement.ViewModel.Models.Country;
global using UserManagement.Application.Commands.Country;
global using UserManagement.Application.Queries.Country;