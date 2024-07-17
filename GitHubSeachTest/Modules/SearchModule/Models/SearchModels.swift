//
//  SearchModels.swift
//  GitHubSeachTest
//
//  Created by Misha Deneka on 16.07.2024.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [SearchItemResponse]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - SearchItemResponse
struct SearchItemResponse: Codable, Identifiable {
    let id: Int
    let nodeID, name, fullName: String
    let owner: OwnerModelResponse
    let itemPrivate: Bool
    let htmlURL: String
    let description: String?
    let url: String?
    let createdAt, updatedAt, pushedAt: String?
    let homepage: String?
    let stargazersCount: Int
    let watchersCount: Int
    let language: String?
    let forkCount: Int
    let openIssueCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case itemPrivate = "private"
        case htmlURL = "html_url"
        case description, url
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case forkCount = "forks_count"
        case openIssueCount = "open_issues_count"
        case language
        case homepage
    }
}

extension SearchItemResponse: Hashable {
    static func == (lhs: SearchItemResponse, rhs: SearchItemResponse) -> Bool {
        lhs.id == rhs.id
    }
}


// MARK: - Owner
struct OwnerModelResponse: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, receivedEventsURL: String
    let type: String
    let htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case receivedEventsURL = "received_events_url"
        case type
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case siteAdmin = "site_admin"
    }
}

extension OwnerModelResponse: Hashable {}
