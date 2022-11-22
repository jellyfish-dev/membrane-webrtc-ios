internal protocol RTCEngineListener {
    func onPeerAccepted(peerId: String, peersInRoom: [Peer])
    func onPeerDenied()
    func onPeerJoined(peer: Peer)
    func onPeerLeft(peerId: String)
    func onPeerUpdated(peerId: String, peerMetadata: Metadata)
    func onOfferData(integratedTurnServers: [OfferDataEvent.TurnServer], tracksTypes: [String: Int])
    func onSdpAnswer(type: String, sdp: String, midToTrackId: [String: String?])
    func onRemoteCandidate(candidate: String, sdpMLineIndex: Int32, sdpMid: String?)
    func onTracksAdded(peerId: String, trackIdToMetadata: [String: Metadata])
    func onTracksRemoved(peerId: String, trackIds: [String])
    func onTrackUpdated(peerId: String, trackId: String, metadata: Metadata)
    func onTrackEncodingChanged(peerId: String, trackId: String, encoding: String)
    func onRemoved(peerId: String, reason: String)
    func onError(error: EventTransportError)
    func onClose()
}
