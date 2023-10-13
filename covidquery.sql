select * 
From PortfolioProject..CovidDeaths$
order by 3,4;

select * 
From PortfolioProject..CovidVaccination$
order by 3,4;

--Looking at TotalCases vs Total Deaths 
--shows the likelihood of dying if you contact covid in your country
select Location, Date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
From PortfolioProject..CovidDeaths$
where location like '%kingdom%'
order by 1,2;

--shows what percentage of the population have got covid
select Location, Date, total_cases, population, (total_cases/population) * 100 as ContactPercentage
From PortfolioProject..CovidDeaths$
where location like '%kingdom%'
order by 1,2;

--looking at countries with the Highest Infection Rate compared to location
select Location, population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population)) * 100 as ContactPercentage
From PortfolioProject..CovidDeaths$
--where location like '%states%'
Group by Location, population
order by ContactPercentage desc

--Showing Countries with Highest Death count per Population

select Location, max(Total_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent  is not NULL
Group by Location
order by TotalDeathCount desc

--Let's break things down by continent
select continent, max(Total_deaths) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent  is not NULL
Group by continent
order by TotalDeathCount desc

--Global Numbers
SELECT Sum(new_cases) AS total_cases, Sum(new_deaths) as total_deaths, SUM(new_deaths)/Sum(NULLIF(new_cases, 0))*100 as DeathPercentage
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
--Group by date
order by 1,2

--looking at Total Population vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccination$ vac
	ON dea.location = vac.location
	and dea.date = vac.date







