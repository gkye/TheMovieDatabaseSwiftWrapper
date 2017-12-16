//
//  Client.swift
//  TheMovieDbSwiftWrapper
//
//  Created by George Kye on 2016-02-05.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client{
	//COMBINATION OF ALL PARAMS, MOVIES & TV
	
	static func discover(baseURL: String, params: [DiscoverParam], completion: @escaping (ClientReturn) -> ()) -> (){
		var parameters: [String : AnyObject] = [:]
		for param in params {
			switch param {
			case .sort_by(let sort_by):
				if (sort_by != nil){
					parameters["sort_by"] = sort_by as AnyObject?;
				}
			case .certification_country(let certification_country):
				if (certification_country != nil){
					parameters["certification_country"] = certification_country as AnyObject?;
				}
			case .certification(let certification):
				if (certification != nil){
					parameters["certification"] = certification as AnyObject?;
				}
			case .certification_lte(let certification_lte):
				if (certification_lte != nil){
					parameters["certification_lte"] = certification_lte as AnyObject?;
				}
			case . include_adult(let  include_adult):
				if ( include_adult != nil){
					parameters["include_adult"] =  include_adult as AnyObject?;
				}
			case .include_video(let include_video):
				if (include_video != nil){
					parameters["include_video"] = include_video as AnyObject?;
				}
			case .primary_release_year(let primary_release_year):
				if (primary_release_year != nil){
					parameters["primary_release_year"] = primary_release_year as AnyObject?;
				}
			case .primary_release_date_gte(let primary_release_date_gte):
				if (primary_release_date_gte != nil){
					parameters["primary_release_date.gte"] = primary_release_date_gte as AnyObject?;
				}
			case .primary_release_date_lte(let primary_release_date_lte):
				if (primary_release_date_lte != nil){
					parameters["primary_release_date.lte"] = primary_release_date_lte as AnyObject?;
				}
			case .release_date_gte(let release_date_gte):
				if (release_date_gte != nil){
					parameters["release_date.gte"] = release_date_gte as AnyObject?;
				}
			case .release_date_lte(let release_date_lte):
				if (release_date_lte != nil){
					parameters["release_date.lte"] = release_date_lte as AnyObject?;
				}
			case . air_date_gte(let  air_date_gte):
				if ( air_date_gte != nil){
					parameters["air_date.gte"] =  air_date_gte as AnyObject?;
				}
			case .air_date_lte(let air_date_lte):
				if (air_date_lte != nil){
					parameters["air_date.lte"] = air_date_lte as AnyObject?;
				}
			case .first_air_date_gte(let first_air_date_gte):
				if (first_air_date_gte != nil){
					parameters["first_air_date.gte"] = first_air_date_gte as AnyObject?;
				}
			case .first_air_date_lte(let first_air_date_lte):
				if (first_air_date_lte != nil){
					parameters["first_air_date.lte"] = first_air_date_lte as AnyObject?;
				}
			case .first_air_date_year(let first_air_date_year):
				if (first_air_date_year != nil){
					parameters["first_air_date_year"] = first_air_date_year as AnyObject?;
				}
			case .language(let language):
				if (language != nil){
					parameters["language"] = language as AnyObject?;
				}
			case .page(let page):
				if (page != nil){
					parameters["page"] = page as AnyObject?;
				}
			case .timezone(let  timezone):
				if ( timezone != nil){
					parameters["timezone"] =  timezone as AnyObject?;
				}
			case .vote_average_gte(let vote_average_gte):
				if (vote_average_gte != nil){
					parameters["vote_average.gte"] = vote_average_gte as AnyObject?;
				}
			case .vote_average_lte(let vote_average_lte):
				if (vote_average_lte != nil){
					parameters["vote_average.lte"] = vote_average_lte as AnyObject?;
				}
			case .vote_count_gte(let vote_count_gte):
				if (vote_count_gte != nil){
					parameters["vote_count.gte"] = vote_count_gte as AnyObject?;
				}
			case .vote_count_lte(let vote_count_lte):
				if (vote_count_lte != nil){
					parameters["vote_count.lte"] = vote_count_lte as AnyObject?;
				}
			case .with_genres(let with_genres):
				if (with_genres != nil){
					parameters["with_genres"] = with_genres as AnyObject?;
				}
			case .with_cast(let with_cast):
				if (with_cast != nil){
					parameters["with_cast"] = with_cast as AnyObject?;
				}
			case .with_crew(let with_crew):
				if (with_crew != nil){
					parameters["with_crew"] = with_crew as AnyObject?;
				}
			case .with_companies(let with_companies):
				if (with_companies != nil){
					parameters["with_companies"] = with_companies as AnyObject?;
				}
			case .with_keywords(let with_keywords):
				if (with_keywords != nil){
					parameters["with_keywords"] = with_keywords as AnyObject?;
				}
			case .with_people(let with_people):
				if (with_people != nil){
					parameters["with_people"] = with_people as AnyObject?;
				}
			case . with_networks(let  with_networks):
				if ( with_networks != nil){
					parameters["with_networks"] =  with_networks as AnyObject?;
				}
			case .year(let year):
				if (year != nil){
					parameters["year"] = year as AnyObject?;
				}
			case .certification_gte(let certification_gte):
				if (certification_gte != nil){
					parameters["certification_gte"] = certification_gte as AnyObject?;
				}
			}
		}
		
		let url = "https://api.themoviedb.org/3/discover/" + baseURL
		networkRequest(url: url, parameters: parameters){
			apiReturn in
			if(apiReturn.error == nil){
				completion(apiReturn)
			}
		}
	}
	
	
	static func discover(baseURL: String!, sort_by: String?, certification_country: String?, certification: String?, certification_lte: String?,  include_adult: Bool?, include_video: Bool?, primary_release_year: Int?, primary_release_date_gte: String?, primary_release_date_lte: String?, release_date_gte: String?, release_date_lte: String?,  air_date_gte: String?, air_date_lte: String?, first_air_date_gte: String?, first_air_date_lte: String?, first_air_date_year: String?, language: String?, page: Int?,  timezone: String?, vote_average_gte: Double?, vote_average_lte: Double?, vote_count_gte: Int?, vote_count_lte: Int?, with_genres: String?, with_cast: String?, with_crew: String?, with_companies: String?, with_keywords: String?, with_people: String?,  with_networks: String?, year: Int?, certification_gte: String?, completion: @escaping (ClientReturn) -> ()) -> (){
		var parameters: [String : AnyObject] = [:]
		
		if (certification_country != nil){
			parameters["certification_country"] = certification_country as AnyObject?;
		}
		if(certification != nil){
			parameters["certification"] = certification as AnyObject?;
		}
		if(certification_lte != nil){
			parameters["certification.lte"] = certification_lte as AnyObject?
		}
		
		if(certification_gte != nil){
			parameters["certification.gte"] = certification_gte as AnyObject?
		}
		
		if(include_adult != nil){
			parameters["include_adult"] = include_adult!.description as AnyObject?
		}
		
		if(include_video != nil){
			parameters["include_video"] = include_adult!.description as AnyObject
		}
		
		if(primary_release_year != nil){
			parameters["primary_release_year"] = primary_release_year as AnyObject?
		}
		
		if(primary_release_date_gte != nil){
			parameters["primary_release_date.gte"] = primary_release_date_gte as AnyObject?
		}
		
		if(primary_release_date_lte != nil){
			parameters["primary_release_date.lte"] = primary_release_date_lte as AnyObject?
		}
		
		if(release_date_gte != nil){
			parameters["release_date.gte"] = release_date_gte as AnyObject?
		}
		
		if(release_date_lte != nil){
			parameters["release_date.lte"] = release_date_lte as AnyObject?
		}
		
		//Date expected format is YYYY-MM-DD.
		if(air_date_gte != nil){
			parameters["air_date.gte"] = air_date_gte as AnyObject?;
		}
		
		if(air_date_lte != nil){
			parameters["air_date.lte"] = air_date_lte as AnyObject?;
		}
		
		if(first_air_date_gte != nil){
			parameters["first_air_date.gte"] = first_air_date_gte as AnyObject?;
		}
		if(first_air_date_lte != nil){
			parameters["first_air_date.lte"] = first_air_date_lte as AnyObject?;
		}
		
		if(first_air_date_year != nil){
			parameters["first_air_date_year"] = first_air_date_year as AnyObject?;
		}
		
		if(language != nil){
			parameters["language"] = language as AnyObject?
		}else{
			parameters["language"] = "EN" as AnyObject?; //Default language is English
		}
		
		//Minimum 1, maximum 1000.
		if(page != nil){
			parameters["page"] = page as AnyObject?
		}
		
		//Available options in `DiscoverSortBy, DiscoverSortByTv and DiscoverSortByMovie claases
		if (sort_by != nil){
			parameters["sort_by"] = sort_by! as AnyObject?
		}
		
		//edit timezones
		if(timezone != nil){
			parameters["timezone"] = timezone as AnyObject?
		}
		
		if(vote_average_gte != nil){
			parameters["vote_average.gte"] = vote_average_gte as AnyObject?
		}
		
		if(vote_count_gte != nil){
			parameters["vote_count.gte"] = vote_count_gte as AnyObject?
		}
		
		if(vote_count_lte != nil){
			parameters["vote_count.lte"] = vote_count_lte as AnyObject?
		}
		
		//Expected value is an integer (the id of a genre). Multiple values can be specified. Comma separated indicates an 'AND' query, while a pipe (|) separated value indicates an 'OR'. For more info http://docs.themoviedb.apiary.io/#reference/discover/discovertv
		if(with_genres != nil){
			parameters["with_genres"] = with_genres as AnyObject?
		}
		
		if(with_cast != nil){
			parameters["with_cast"] = with_cast as AnyObject?
		}
		
		if(with_crew != nil){
			parameters["with_crew"] = with_crew as AnyObject?
		}
		
		if(with_companies != nil){
			parameters["with_companies"] = with_companies as AnyObject?
		}
		
		if(with_networks != nil){
			parameters["with_networks"] = with_networks as AnyObject?
		}
		
		if(with_keywords != nil){
			parameters["with_keywords"] = with_keywords as AnyObject?
		}
		
		if(with_people != nil){
			parameters["with_people"] = with_people as AnyObject?
		}
		
		if(year != nil){
			parameters["year"] = year as AnyObject?
		}
		
		let url = "https://api.themoviedb.org/3/discover/" + baseURL
		
		networkRequest(url: url, parameters: parameters){
			apiReturn in
			if(apiReturn.error == nil){
				completion(apiReturn)
			}
		}
	}
	
	
}
